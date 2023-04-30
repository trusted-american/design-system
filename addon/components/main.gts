import Component from '@glimmer/component';

export interface MainSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class Main extends Component<MainSignature> {
  <template>
    <main
      id='main'
      class='d-flex flex-column flex-grow-1 bg-white overflow-y-auto rounded-start shadow'
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
