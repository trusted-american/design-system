import Component from '@glimmer/component';

export interface FormLabelComponentSignature {
  Element: HTMLInputElement;
  Args: {
    text?: string;
    identifier: string;
    required?: unknown;
  };
}

export default class FormLabelComponent extends Component<FormLabelComponentSignature> {
  <template>
    {{#if @text}}
      <label for={{@identifier}} class="form-label">
        {{@text}}
        {{#if @required}}
          <span class="text-danger">
            *
          </span>
        {{/if}}
      </label>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Label': typeof FormLabelComponent;
  }
}
