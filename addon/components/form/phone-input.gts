import Component from '@glimmer/component';
import FormInput, { type FormInputArgs } from './input';
import { fn } from '@ember/helper';

interface Args extends FormInputArgs {
  value: string | null | undefined;
  onChange: (value: string | null) => void;
}

export interface FormPhoneInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormPhoneInput extends Component<FormPhoneInputSignature> {
  get value(): string {
    const value = this.args.value ?? '';
    const arr = /(\d{0,3})(\d{0,3})(\d{0,4})/.exec(
      value.replace('+1', '').replace(/\D/g, ''),
    ) as RegExpMatchArray;
    return (
      (!arr[2]
        ? arr[1]
        : '(' + arr[1]! + ') ' + arr[2] + (arr[3] ? '-' + arr[3] : '')) ?? ''
    );
  }

  set value(value: string) {
    value = value.replace(/\D/g, '');
    if (value) {
      value = '+1' + value;
      this.args.onChange(value);
    } else {
      this.args.onChange(null);
    }
  }

  <template>
    <FormInput
      @type="tel"
      @value={{this.value}}
      @label={{@label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
      @help={{@help}}
      @invalidFeedback={{@invalidFeedback}}
      @requiredLabel={{@requiredLabel}}
      @size={{@size}}
      @isInputOnly={{@isInputOnly}}
      @errors={{@errors}}
      @onChange={{fn (mut this.value)}}
      maxlength="14"
      pattern="\([0-9]{3}\) [0-9]{3}-[0-9]{4}"
      autocomplete="tel-national"
      data-test-form-phone-input
      ...attributes
    >
      +1
    </FormInput>
  </template>
}
