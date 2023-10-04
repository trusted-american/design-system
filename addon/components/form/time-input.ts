import Component from '@glimmer/component';
import { action } from '@ember/object';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';

export interface FormTimeInputSignature {
  Args: {
    value: Date | null;
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

export default class FormTimeInput extends Component<FormTimeInputSignature> {
  get value(): string {
    const { value } = this.args;

    if (!value || !isValidDate(value)) {
      return '';
    }

    const hours = value.getHours();
    const minutes = value.getMinutes();

    return [
      hours < 10 ? '0' + (hours as unknown as string) : hours,
      minutes < 10 ? '0' + (minutes as unknown as string) : minutes,
    ].join(':');
  }

  @action
  change({ target }: Event): void {
    const v = (target as HTMLInputElement).value;

    const value = this.args.value ? new Date(this.args.value) : new Date();
    const [hours, minutes] = v.split(':').map(Number);
    if (hours) value.setHours(hours);
    if (minutes || minutes === 0) value.setMinutes(minutes);

    this.args.onChange(value);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::TimeInput': typeof FormTimeInput;
  }
}
