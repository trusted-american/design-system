import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

interface FormHtmlInputSignature {
  Args: {
    value: string | null | undefined;
    label: string;
    identifier: string;
    required?: boolean;
    inputOnly?: boolean;
    help?: string;
    onChange: (value: string) => void;
  };
  Element: HTMLElement;
}

export default class FormHtmlInput extends Component<FormHtmlInputSignature> {
  @tracked isCode = false;

  // TODO: debt https://github.com/PoslinskiNet/ember-pell/pull/130
  get value(): string | null {
    if (!this.args.value) {
      const element = document.querySelector('.pell-content');
      if (element) {
        element.innerHTML = '';
      }
    }
    // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
    return this.args.value!;
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::HtmlInput': typeof FormHtmlInput;
  }
}
