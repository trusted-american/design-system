import Component from '@glimmer/component';

export interface AsideTitleSignature {
  Args: {
    text: string;
  };
  Element: HTMLDivElement;
}

export default class AsideTitle extends Component<AsideTitleSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Title': typeof AsideTitle;
  }
}
