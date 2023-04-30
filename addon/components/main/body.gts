import Component from '@glimmer/component';

export interface MainBodySignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainBody extends Component<MainBodySignature> {
  <template>
    <article class='container-fluid flex-grow-1 py-4' ...attributes>
      {{yield}}
    </article>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Body': typeof MainBody;
  }
}
