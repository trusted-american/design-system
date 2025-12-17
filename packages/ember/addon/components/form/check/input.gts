import { on } from '@ember/modifier';
import Component from '@glimmer/component';

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
  change = ({ target }: Event) => {
    if (!(target instanceof HTMLInputElement)) {
      throw new Error();
    }
    this.args.onChange(target.checked);
  };

  <template>
    <input
      type="checkbox"
      id={{@identifier}}
      checked={{@value}}
      class="form-check-input"
      required={{@isRequired}}
      aria-label={{if @isInputOnly @label}}
      {{on "input" this.change}}
      ...attributes
    />
  </template>
}
