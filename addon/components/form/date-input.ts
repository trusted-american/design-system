import Component from '@glimmer/component';
import { assert } from '@ember/debug';
import { typeOf } from '@ember/utils';
import { action } from '@ember/object';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';

export interface FormDateInputSignature {
  Args: {
    value: Date | null | unknown;
    min?: Date | null;
    max?: Date | null;
    label?: string;
    required?: boolean;
    identifier: string;
    size?: 'sm' | 'lg';
    help?: string;
    invalidFeedback?: string;
    onChange: (value: Date | null) => void;
  };
  Element: HTMLInputElement;
}

export default class FormDateInput extends Component<FormDateInputSignature> {
  constructor(owner: unknown, args: FormDateInputSignature['Args']) {
    super(owner, args);

    assert(
      '<Form::DateInput />: Must pass an onChange function',
      typeOf(this.args.onChange) === 'function'
    );
  }

  get value(): string | null {
    if (this.args.value) {
      return this.dateToString(this.args.value as Date);
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
    if (isValidDate(date) && date.toISOString) {
      return date.toISOString().split('T')[0] ?? null;
    }
    return null;
  }

  @action
  change({ target }: Event): void {
    const d = new Date((target as HTMLInputElement).value);
    const date = new Date(d.getTime() + d.getTimezoneOffset() * 60 * 1000);

    let value;

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
