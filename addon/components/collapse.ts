import Component from '@glimmer/component';

export interface CollapseSignature {
  Args: {
    horizontal?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class Collapse extends Component<CollapseSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Collapse: typeof Collapse;
  }
}
