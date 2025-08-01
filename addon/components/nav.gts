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
  {{#if @isStatic}}
    <nav
      class="flex flex-nowrap
        {{unless @isPills 'nav-tabs'}}
        {{if @isPills 'nav-pills'}}
        {{if @isFill 'nav-fill'}}
        {{if @isVertical 'flex-col'}}"
      data-test-nav
      ...attributes
    >
      {{yield (hash item=(component NavItem isPills=@isPills))}}
    </nav>
  {{else}}
    <div
      class="text-sm font-medium text-center text-gray-500 border-b border-gray-200"
      data-test-nav
      ...attributes
    >
      <ul class="flex flex-wrap -mb-px {{if @isVertical 'flex-col'}}">
        {{yield (hash item=NavItem)}}
      </ul>
    </div>

    {{!-- <div class="overflow-x-auto" ...attributes>
      {{! template-lint-disable no-duplicate-landmark-elements }}
      <nav
        class="flex flex-nowrap
          {{unless @isPills 'nav-tabs'}}
          {{if @isPills 'nav-pills'}}
          {{if @isFill 'nav-fill'}}
          {{if @isVertical 'flex-col'}}"
        data-test-nav
      >
        {{yield (hash item=NavItem)}}
      </nav>
    </div> --}}
  {{/if}}
</template>;

export default Nav;
