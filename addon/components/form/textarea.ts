import Component from '@glimmer/component';

export interface FormTextareaComponentSignature {
  Element: HTMLTextAreaElement;
  Args: {
    value: string | null | undefined;
    size?: 'sm' | 'lg';
    label?: string;
    identifier: string;
    required?: boolean;
    help?: string;
  };
}

export default class FormTextareaComponent extends Component<FormTextareaComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Textarea': typeof FormTextareaComponent;
  }
}
