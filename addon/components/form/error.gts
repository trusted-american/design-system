import Component from '@glimmer/component';

export interface FormErrorSignature {
  Element: HTMLDivElement;
  Args: {
    text?: string;
  };
}

export default class FormError extends Component<FormErrorSignature> {
  <template>
    {{#if @text}}
      <div class='invalid-feedback' ...attributes>
        {{@text}}
      </div>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Error': typeof FormError;
  }
}
