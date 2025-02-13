import Component from '@glimmer/component';

export interface SnippetSignature {
  Args: {
    name: string;
  };
  Blocks: {
    default: [];
  };
}

export default class Snippet extends Component<SnippetSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Snippet: typeof Snippet;
  }
}
