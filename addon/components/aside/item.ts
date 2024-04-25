import Component from '@glimmer/component';

export interface AsideItemSignature {
  Args: {
    text: string;
    icon?: string;
    route?: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class AsideItem extends Component<AsideItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Item': typeof AsideItem;
  }
}
