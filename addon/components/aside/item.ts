import Component from '@glimmer/component';

export interface AsideItemComponentSignature {
  Element: HTMLAnchorElement;
  Args: {
    text: string;
    icon: string;
    route: string;
  };
}

export default class AsideItemComponent extends Component<AsideItemComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Item': typeof AsideItemComponent;
  }
}
