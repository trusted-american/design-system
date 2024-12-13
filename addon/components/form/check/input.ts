import Component from '@glimmer/component';
import { action } from '@ember/object';

export interface FormCheckInputSignature {
  Args: {
    value: boolean | null | undefined;
    label: string;
    identifier: string;
    isRequired?: boolean;
    isInputOnly?: boolean;
    onChange: (value: boolean) => void;
  };
  Element: HTMLInputElement;
}

export default class FormCheckInput extends Component<FormCheckInputSignature> {
  @action
  change({ target }: Event): void {
    if (!(target instanceof HTMLInputElement)) {
      throw new Error();
    }
    this.args.onChange(target.checked);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check::Input': typeof FormCheckInput;
  }
}
