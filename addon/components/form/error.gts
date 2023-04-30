import Component from '@glimmer/component';

export interface FormErrorComponentSignature {
  Element: HTMLDivElement;
  Args: {
    text?: string;
  };
}

export default class FormErrorComponent extends Component<FormErrorComponentSignature> {
  <template>
    {{#if @text}}
      <div class="invalid-feedback" ...attributes>
        {{@text}}
      </div>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Error': typeof FormErrorComponent;
  }
}
