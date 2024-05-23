import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  value: string | null;
  editorText: string;
  codeText: string;
  onChange: (value: string) => void;
}

export interface FormHtmlInputSignature {
  Args: Args;
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
    return this.args.value;
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::HtmlInput': typeof FormHtmlInput;
  }
}
