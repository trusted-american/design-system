import Component from '@glimmer/component';
interface CodeBlockSignature {
  Args: {
    code: string;
    language?: string;
    showLineNumbers?: boolean;
    start?: string;
  };
  Element: HTMLElement;
}

export declare function setup(): void;
export default class CodeBlockComponent extends Component<CodeBlockSignature> {
  get language(): string;
  get languageClass(): string;
}
declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CodeBlock: typeof CodeBlockComponent;
  }
}
export {};
