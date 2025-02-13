import Component from '@glimmer/component';
import { action } from '@ember/object';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  value: string | null | undefined;
  onChange: (value: string) => void;
}

export interface FormTextareaSignature {
  Args: Args;
  Element: HTMLTextAreaElement;
}

export default class FormTextarea extends Component<FormTextareaSignature> {
  @action
  change({ target }: Event): void {
    if (!(target instanceof HTMLTextAreaElement)) {
      throw new Error();
    }
    this.args.onChange(target.value);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Textarea': typeof FormTextarea;
  }
}
