import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import type { WithBoundArgs } from '@glint/template';
import NavItem from './nav/item';

export interface NavSignature {
  Args: {
    isPills?: boolean;
    isFill?: boolean;
    isVertical?: boolean;
    isStatic?: boolean;
  };
  Blocks: {
    default: [{ item: WithBoundArgs<typeof NavItem, 'isPills'> }];
  };
  Element: HTMLElement;
}

const Nav: TOC<NavSignature> = <template>
  {{!-- TODO: {{if @isFill 'nav-fill'}} --}}
  {{!unless @isStatic "overflow-x-auto"}}
  <div ...attributes>
    <div
      class="font-medium text-gray-500
        {{unless @isPills 'text-center border-b border-gray-200'}}
        "
      data-test-nav
    >
      <ul class="flex flex-wrap -mb-px {{if @isVertical 'flex-col'}}">
        {{yield (hash item=(component NavItem isPills=@isPills))}}
      </ul>
    </div>
  </div>
</template>;

export default Nav;
