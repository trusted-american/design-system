import type { TOC } from '@ember/component/template-only';

export interface FormHelpSignature {
  Args: {
    label?: string;
  };
  Element: HTMLDivElement;
}

const FormHelp: TOC<FormHelpSignature> = <template>
  {{#if @label}}
    <div class="form-text" data-test-form-help ...attributes>
      {{@label}}
    </div>
  {{/if}}
</template>;

export default FormHelp;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Help': typeof FormHelp;
  }
}
