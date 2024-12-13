import Component from '@glimmer/component';
import { action } from '@ember/object';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';

import type { BaseArgs } from './input';

dayjs.extend(utc);

interface Args extends BaseArgs {
  value: Date | null | undefined;
  min?: Date | null;
  max?: Date | null;
  size?: 'sm' | 'lg';
  isMonth?: boolean;
  isLocalTimeZone?: boolean;
  onChange: (value: Date | null) => void;
}

export interface FormDateInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormDateInput extends Component<FormDateInputSignature> {
  get value(): string | null {
    if (this.args.value) {
      if (this.args.isMonth) {
        const djs = dayjs(this.args.value).utc(false);
        return djs.format('YYYY-MM');
      }
      return this.dateToString(this.args.value);
    }
    return '';
  }

  get min(): string | null {
    if (this.args.min) {
      return this.dateToString(this.args.min);
    }
    return '';
  }

  get max(): string | null {
    if (this.args.max) {
      return this.dateToString(this.args.max);
    }
    return '';
  }

  private dateToString(date: Date): string | null {
    // @ts-expect-error shouldn't be necessary to check toISOString
    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    if (isValidDate(date) && date.toISOString) {
      const djs = this.args.isLocalTimeZone
        ? dayjs(date)
        : dayjs(date).utc(false);
      const value = djs.format('YYYY-MM-DD');
      return value;
    }
    return null;
  }

  @action
  change(dateStr: string): void {
    if (this.args.isLocalTimeZone) {
      let value: Date | null = dayjs(dateStr).toDate();

      // https://github.com/iamkun/dayjs/issues/1237
      const [yearStr] = dateStr.split('-');
      if (yearStr) {
        value.setFullYear(parseInt(yearStr));
      }

      if (!isValidDate(value)) {
        value = null;
      }

      this.args.onChange(value);
      return;
    }

    let value: Date | null = new Date(dateStr);

    if (isValidDate(value)) {
      if (value.getFullYear() > 9999) {
        value.setFullYear(Math.floor(value.getFullYear() / 10));
      }
    } else {
      value = null;
    }

    this.args.onChange(value);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::DateInput': typeof FormDateInput;
  }
}
