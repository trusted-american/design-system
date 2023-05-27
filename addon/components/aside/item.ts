import Component from '@glimmer/component';

export interface AsideItemSignature {
  Element: HTMLAnchorElement;
  Args: {
    text: string;
    icon: string;
    route: string;
  };
}

export default class AsideItem extends Component<AsideItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Item': typeof AsideItem;
  }
}
