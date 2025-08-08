import type { TOC } from '@ember/component/template-only';
import { fn } from '@ember/helper';
import FormInput, { type FormInputArgs } from './input';

const format = (value: number | null | undefined): string | undefined =>
  value?.toString();

const toNumber = (fn: (value: number | null) => void, value: string) => {
  const number =
    value === '' || isNaN(Number(value)) ? null : parseFloat(value);
  fn(number);
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

const FormNumberInput: TOC<FormNumberInputSignature> = <template>
  <FormInput
    class="block w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors duration-200 ease-in-out"
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
    @onChange={{fn toNumber @onChange}}
    data-test-form-number-input
    ...attributes
  />
</template>;

export default FormNumberInput;
