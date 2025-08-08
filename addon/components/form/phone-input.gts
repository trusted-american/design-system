import { action } from '@ember/object';
import Component from '@glimmer/component';
import FormFeedback from './feedback';
import FormHelp from './help';
import FormInput, { type FormInputArgs } from './input';
import FormLabel from './label';

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

  @action
  change(_value: string): void {
    let value = _value.replace(/\D/g, '');
    if (value) {
      value = '+1' + value;
      this.args.onChange(value);
    } else {
      this.args.onChange(null);
    }
  }

  <template>
    {{#unless @isInputOnly}}
      <FormLabel
        @label={{@label}}
        @identifier={{@identifier}}
        @isRequired={{@isRequired}}
        @requiredLabel={{@requiredLabel}}
      />
    {{/unless}}

    <div class="flex">
      <span
        class="px-3 py-2 bg-gray-100 border border-gray-300 rounded-l-lg text-gray-700"
      >+1</span>
      <FormInput
        class="block w-full px-3 py-2 border border-gray-300 rounded-none rounded-r-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors duration-200 ease-in-out border-l-0 bg-white"
        @type="tel"
        @value={{this.value}}
        @label={{@label}}
        @identifier={{@identifier}}
        @isRequired={{@isRequired}}
        @requiredLabel={{@requiredLabel}}
        @isInputOnly={{true}}
        @onChange={{this.change}}
        maxlength="14"
        pattern="\([0-9]{3}\) [0-9]{3}-[0-9]{4}"
        autocomplete="tel-national"
        data-test-form-phone-input
        ...attributes
      />
    </div>

    <FormFeedback @validLabel={{@validLabel}} @invalidLabel={{@invalidLabel}} />

    {{#each @errors as |error|}}
      <FormFeedback @validLabel={{undefined}} @invalidLabel={{error.message}} />
    {{/each}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
