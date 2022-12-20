import Component from '@glimmer/component';

export interface AsideComponentSignature {
  Element: HTMLElement;
  Args: {
    title: string;
    logo: string;
    route: string;
  };
  Blocks: {
    default: [];
    lower: [];
    bottom: [];
  };
}

export default class AsideComponent extends Component<AsideComponentSignature> {}
