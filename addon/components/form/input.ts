import Component from '@glimmer/component';
import { action } from '@ember/object';

export interface BaseArgs {
  label: string;
  identifier: string;
  isRequired?: boolean;
  help?: string;
  invalidFeedback?: string;
  isInputOnly?: boolean;
}

interface Args extends BaseArgs {
  value: string | null | undefined;
  type?: string;
  size?: 'sm' | 'lg';
  errors?: { message: string }[];
  onChange: (value: string) => void;
}

export interface FormInputSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLInputElement;
}

export default class FormInput extends Component<FormInputSignature> {
  @action
  change({ target }: Event): void {
    if (!(target instanceof HTMLInputElement)) {
      throw new Error();
    }
    this.args.onChange(target.value);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Input': typeof FormInput;
  }
}
