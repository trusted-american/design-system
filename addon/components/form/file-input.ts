import Component from '@glimmer/component';
import { action } from '@ember/object';

export interface FormFileInputComponentSignature {
  Element: HTMLInputElement;
  Args: {
    label?: string;
    identifier: string;
    required?: unknown;
    help?: string;
    invalidFeedback?: string;
    onChange: (file: File) => void;
  };
}

export default class FormFileInputComponent extends Component<FormFileInputComponentSignature> {
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

// declare module '@glint/environment-ember-loose/registry' {
//   export default interface Registry {
//     'Form::FileInput': typeof FormFileInputComponent;
//   }
// }
