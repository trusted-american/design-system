import Component from '@glimmer/component';

export interface MainTopHeaderSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainTopHeader extends Component<MainTopHeaderSignature> {
  <template>
    <header
      class='container-fluid position-relative text-secondary border-bottom py-2'
      ...attributes
    >
      {{yield}}
    </header>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::TopHeader': typeof MainTopHeader;
  }
}
