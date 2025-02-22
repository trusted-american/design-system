import type { TOC } from '@ember/component/template-only';

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

const Nav: TOC<NavSignature> = <template>
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
</template>;

export default Nav;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Nav: typeof Nav;
  }
}
