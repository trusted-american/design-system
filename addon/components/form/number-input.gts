import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormInput, { type FormInputArgs } from './input';

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
  get value(): string | undefined {
    return this.args.value?.toString();
  }

  @action
  change(value: string): void {
    const number =
      value === '' || isNaN(Number(value)) ? null : parseFloat(value);
    this.args.onChange(number);
  }

  <template>
    <FormInput
      @type={{if @type @type "number"}}
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
      @onChange={{this.change}}
      ...attributes
    />
  </template>
}
