import NavItem from './nav/item';
import { hash } from '@ember/helper';

import type { TOC } from '@ember/component/template-only';

export interface NavSignature {
  Args: {
    isPills?: boolean;
    isFill?: boolean;
    isVertical?: boolean;
  };
  Blocks: {
    default: [
      {
        item: typeof NavItem;
      },
    ];
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
      {{yield (hash item=NavItem)}}
    </nav>
  </div>
</template>;

export default Nav;
