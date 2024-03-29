import Component from '@glimmer/component';
import { action } from '@ember/object';

export interface FormFileInputSignature {
  Args: {
    label: string;
    identifier: string;
    required?: boolean;
    help?: string;
    invalidFeedback?: string;
    inputOnly?: boolean;
    onChange: (file: File) => void;
  };
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
