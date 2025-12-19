import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import NavItem from './nav/item';

export interface NavSignature {
  Args: {
    isPills?: boolean;
    isFill?: boolean;
    isVertical?: boolean;
    isStatic?: boolean;
  };
  Blocks: {
    default: [{ item: typeof NavItem }];
  };
  Element: HTMLElement;
}

<template>
  {{#if @isStatic}}
    <nav
      class="nav flex-nowrap
        {{unless @isPills 'nav-tabs'}}
        {{if @isPills 'nav-pills'}}
        {{if @isFill 'nav-fill'}}
        {{if @isVertical 'flex-column'}}"
      data-test-nav
      ...attributes
    >
      {{yield (hash item=NavItem)}}
    </nav>
  {{else}}
    <div class="overflow-x-auto" ...attributes>
      {{! template-lint-disable no-duplicate-landmark-elements }}
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
  {{/if}}
</template> satisfies TOC<NavSignature>;
