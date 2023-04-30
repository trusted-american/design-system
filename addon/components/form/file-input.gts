import Component from '@glimmer/component';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import FormLabel from './label';
import FormError from './error';
import FormHelp from './help';

export interface FormFileInputComponentSignature {
  Element: HTMLInputElement;
  Args: {
    label?: string;
    identifier: string;
    required?: boolean;
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

  <template>
    <FormLabel
      @text={{@label}}
      @identifier={{@identifier}}
      @required={{@required}}
    />

    <input
      type="file"
      id={{@identifier}}
      class="form-control"
      required={{@required}}
      {{on "change" this.change}}
      ...attributes
    />

    <FormError @text={{@invalidFeedback}} />
    <FormHelp @text={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::FileInput': typeof FormFileInputComponent;
  }
}
