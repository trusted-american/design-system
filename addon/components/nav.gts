import Component from '@glimmer/component';

export interface NavSignature {
  Args: {
    isPills?: boolean;
    isFill?: boolean;
    isVertical?: boolean;
  };
  Blocks: {
    default: [];
    footer: [];
  };
  Element: HTMLElement;
}

export default class Nav extends Component<NavSignature> {
  <template>
    <div class="overflow-x-auto" ...attributes>
      <nav
        class="nav flex-nowrap
          {{unless @isPills 'nav-tabs'}}
          {{if @isPills 'nav-pills'}}
          {{if @isFill 'nav-fill'}}
          {{if @isVertical 'flex-column'}}"
        data-test-nav
      >
        {{yield}}
      </nav>
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Nav: typeof Nav;
  }
}
