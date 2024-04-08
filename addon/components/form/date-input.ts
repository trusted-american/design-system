import Component from '@glimmer/component';
import { action } from '@ember/object';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';

dayjs.extend(utc);

export interface FormDateInputSignature {
  Args: {
    value: Date | null | undefined;
    min?: Date | null;
    max?: Date | null;
    label: string;
    identifier: string;
    required?: boolean;
    help?: string;
    invalidFeedback?: string;
    inputOnly?: boolean;
    size?: 'sm' | 'lg';
    isLocalTimeZone?: boolean;
    onChange: (value: Date | null) => void;
  };
  Element: HTMLInputElement;
}

export default class FormDateInput extends Component<FormDateInputSignature> {
  get value(): string | null {
    if (this.args.value) {
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
  change({ target }: Event): void {
    if (this.args.isLocalTimeZone) {
      const value = dayjs((target as HTMLInputElement).value).toDate();
      this.args.onChange(value);
      return;
    }

    const date = new Date((target as HTMLInputElement).value);

    let value;

    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    if (!date.toISOString || isNaN(date.getTime())) {
      value = null;
    } else if (date.getFullYear() > 9999) {
      date.setFullYear(Math.floor(date.getFullYear() / 10));
      value = date;
    } else {
      value = date;
    }

    this.args.onChange(value);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::DateInput': typeof FormDateInput;
  }
}
