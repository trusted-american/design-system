import Component from '@glimmer/component';

export interface FormTextareaSignature {
  Args: {
    value: string | null | undefined;
    size?: 'sm' | 'lg';
    label?: string;
    identifier: string;
    required?: boolean;
    help?: string;
  };
  Element: HTMLTextAreaElement;
}

export default class FormTextarea extends Component<FormTextareaSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Textarea': typeof FormTextarea;
  }
}
