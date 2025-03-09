import type { TOC } from '@ember/component/template-only';

export interface FormHelpSignature {
  Args: {
    label: string;
  };
  Element: HTMLDivElement;
}

const FormHelp: TOC<FormHelpSignature> = <template>
  <div class="form-text" data-test-form-help ...attributes>
    {{@label}}
  </div>
</template>;

export default FormHelp;
