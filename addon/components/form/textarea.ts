import Component from '@glimmer/component';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  value: string | null | undefined;
  size?: 'sm' | 'lg';
}

export interface FormTextareaSignature {
  Args: Args;
  Element: HTMLTextAreaElement;
}

export default class FormTextarea extends Component<FormTextareaSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Textarea': typeof FormTextarea;
  }
}
