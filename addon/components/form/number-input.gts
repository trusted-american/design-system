import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormInput, { type FormInputArgs } from './input';

const format = (value: number | null | undefined): string | undefined => {
  return value?.toString();
};

interface Args extends FormInputArgs {
  value: number | null | undefined;
  type?: 'number' | 'range';
  onChange: (value: number | null) => void;
}

export interface FormNumberInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormNumberInput extends Component<FormNumberInputSignature> {
  @action
  change(value: string): void {
    const number =
      value === '' || isNaN(Number(value)) ? null : parseFloat(value);
    this.args.onChange(number);
  }

  <template>
    <FormInput
      @type={{if @type @type "number"}}
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
      data-test-form-number-input
      ...attributes
    />
  </template>
}
