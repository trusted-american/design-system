import Component from '@glimmer/component';

export interface MainBodyComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainBodyComponent extends Component<MainBodyComponentSignature> {
  <template>
    <article class="container-fluid flex-grow-1 py-4" ...attributes>
      {{yield}}
    </article>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Body': typeof MainBodyComponent;
  }
}
