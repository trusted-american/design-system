import AsideItem from './aside/item';
import Button from './button';
import Nav from './nav';
import tooltip from '../modifiers/tooltip';
import { on } from '@ember/modifier';
import { fn, hash } from '@ember/helper';
import { LinkTo } from '@ember/routing';

import type { TOC } from '@ember/component/template-only';

export interface AsideSignature {
  Args: {
    title: string;
    logo: string;
    route: string;
    isCollapsed: boolean;
    collapseLabel: string;
    onChange: (isCollapsed: boolean) => void;
  };
  Blocks: {
    header: [];
    default: [{ item: typeof AsideItem }];
    footerNav: [];
    footer: [];
  };
}

const Aside: TOC<AsideSignature> = <template>
  {{#unless @isCollapsed}}
    <aside
      class="d-flex flex-column flex-shrink-0 overflow-y-auto border-end gap-3 py-3 ps-3"
      data-test-aside
    >
      <div class="d-flex gap-3 pe-3">
        <LinkTo
          @route={{@route}}
          class="d-flex align-items-center text-reset text-decoration-none flex-grow-1"
        >
          <img src={{@logo}} alt={{@title}} class="tds-aside-logo me-2" />
          <h5 class="tds-aside-title mb-0">{{@title}}</h5>
        </LinkTo>
        <Button
          @label={{@collapseLabel}}
          @icon="angles-left"
          @color="none"
          @isIconOnly={{true}}
          {{tooltip @collapseLabel trigger="hover"}}
          {{on "click" (fn @onChange true)}}
        />
      </div>

      {{#if (has-block "header")}}
        <div class="pe-3">
          {{yield to="header"}}
        </div>
      {{/if}}

      <div class="flex-grow-1 overflow-y-auto pe-3">
        <Nav @isPills={{true}} @isVertical={{true}} aria-label="Main nav">
          {{yield (hash item=AsideItem)}}
        </Nav>
      </div>

      {{#if (has-block "footerNav")}}
        <div class="pe-3">
          <Nav @isPills={{true}} @isVertical={{true}} aria-label="Footer nav">
            {{yield to="footerNav"}}
          </Nav>
        </div>
      {{/if}}

      {{#if (has-block "footer")}}
        <div class="pe-3">
          {{yield to="footer"}}
        </div>
      {{/if}}
    </aside>
  {{/unless}}
</template>;

export default Aside;
