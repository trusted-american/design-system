import Component from '@glimmer/component';
import { action } from '@ember/object';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  inputOnly?: boolean;
  onChange: (file: File) => void;
}

export interface FormFileInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormFileInput extends Component<FormFileInputSignature> {
  @action
  change(event: Event): void {
    const { target } = event as Event & { target: HTMLInputElement };
    if (!target.files) {
      return;
    }
    const [file] = Array.from(target.files);
    if (file) {
      this.args.onChange(file);
    } else {
      target.value = '';
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::FileInput': typeof FormFileInput;
  }
}
