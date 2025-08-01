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
  <div
    class="text-sm font-medium text-center text-gray-500
      {{unless @isPills 'border-b border-gray-200'}}
      {{unless @isStatic 'overflow-x-auto'}}"
    data-test-nav
    ...attributes
  >
    <ul class="flex flex-wrap -mb-px {{if @isVertical 'flex-col'}}">
      {{yield (hash item=(component NavItem isPills=@isPills))}}
    </ul>
  </div>
</template>;

export default Nav;
