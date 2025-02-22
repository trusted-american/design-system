import Component from '@glimmer/component';

export interface MainSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class Main extends Component<MainSignature> {
  <template>
    <main
      class="d-flex flex-column flex-grow-1 bg-body overflow-y-auto"
      data-test-main
      ...attributes
    >
      {{yield}}
    </main>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Main: typeof Main;
  }
}
