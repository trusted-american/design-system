import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

import type { BaseArgs } from './input';

import '@github/markdown-toolbar-element';

interface Args extends BaseArgs {
  value: string | null;
  onChange: (value: string) => void;
}

export interface FormMarkdownInputSignature {
  Args: Args;
  Element: HTMLElement;
}

export default class FormMarkdownInput extends Component<FormMarkdownInputSignature> {
  @tracked isPreview = false;
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::MarkdownInput': typeof FormMarkdownInput;
  }
}
