import Component from '@glimmer/component';

export interface FormHelpSignature {
  Element: HTMLDivElement;
  Args: {
    text?: string;
  };
}

export default class FormHelp extends Component<FormHelpSignature> {
  <template>
    {{#if @text}}
      <div class='form-text' ...attributes>
        {{@text}}
      </div>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Help': typeof FormHelp;
  }
}
