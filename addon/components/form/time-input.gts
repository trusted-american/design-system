import Component from '@glimmer/component';
import isValidDate from '../../utils/is-valid-date';
import FormInput, { type FormInputArgs } from './input';

const format = (value: Date | null): string => {
  if (!value || !isValidDate(value)) {
    return '';
  }

  return [value.getHours(), value.getMinutes()]
    .map((value) => value.toString().padStart(2, '0'))
    .join(':');
};

interface Args extends FormInputArgs {
  value: Date | null;
  onChange: (value: Date | null) => void;
}

export interface FormTimeInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormTimeInput extends Component<FormTimeInputSignature> {
  change = (_value: string) => {
    const value = this.args.value ?? new Date();
    const [hours, minutes] = _value.split(':').map(Number);

    if (hours) {
      value.setHours(hours);
    }
    if (minutes || minutes === 0) {
      value.setMinutes(minutes);
    }

    this.args.onChange(value);
  };

  <template>
    <FormInput
      @type="time"
      @value={{format @value}}
      @label={{@label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
      @help={{@help}}
      @invalidLabel={{@invalidLabel}}
      @requiredLabel={{@requiredLabel}}
      @size={{@size}}
      @isInputOnly={{@isInputOnly}}
      @errors={{@errors}}
      @onChange={{this.change}}
      data-test-form-time-input
      ...attributes
    />
  </template>
}
