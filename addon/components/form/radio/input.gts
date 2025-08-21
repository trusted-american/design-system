import type { TOC } from '@ember/component/template-only';

export interface FormRadioInputSignature {
  Args: {
    checked: boolean;
    name: string;
    identifier: string;
    isRequired?: boolean;
  };
  Element: HTMLInputElement;
}

const FormRadioInput: TOC<FormRadioInputSignature> = <template>
  <label class="inline-flex">
    <input
      type="radio"
      class="sr-only peer"
      name={{@name}}
      id={{@identifier}}
      checked={{@checked}}
      required={{@isRequired}}
      ...attributes
    />
    <span
      class="w-4 h-4 rounded-full border-2 border-gray-300 bg-white peer-checked:bg-blue-600 peer-checked:border-blue-600 relative peer-checked:after:content-[''] peer-checked:after:absolute peer-checked:after:top-1/2 peer-checked:after:left-1/2 peer-checked:after:-translate-x-1/2 peer-checked:after:-translate-y-1/2 peer-checked:after:w-1.5 peer-checked:after:h-1.5 peer-checked:after:bg-white peer-checked:after:rounded-full"
    ></span>
  </label>
</template>;

export default FormRadioInput;
