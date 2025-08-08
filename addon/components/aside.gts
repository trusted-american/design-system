import type { TOC } from '@ember/component/template-only';
import { fn, hash } from '@ember/helper';
import { on } from '@ember/modifier';
import { LinkTo } from '@ember/routing';
import { faAnglesLeft } from '@fortawesome/free-solid-svg-icons';
import tooltip from '../modifiers/tooltip';
import AsideGroup from './aside/group';
import AsideItem from './aside/item';
import AsideTitle from './aside/title';
import Button from './button';
import Nav from './nav';

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
    default: [
      {
        item: typeof AsideItem;
        group: typeof AsideGroup;
        title: typeof AsideTitle;
      },
    ];
    footerNav: [{ item: typeof AsideItem }];
    footer: [];
  };
}

const Aside: TOC<AsideSignature> = <template>
  {{#unless @isCollapsed}}
    <aside
      class="flex flex-col flex-shrink-0 overflow-y-auto border-r gap-4 py-4 ps-4 w-72"
      data-test-aside
    >
      <div class="flex gap-4 pe-4">
        <LinkTo
          @route={{@route}}
          class="flex items-center text-reset flex-grow"
        >
          <img src={{@logo}} alt={{@title}} class="tds-aside-logo h-8 me-2" />
          <h5 class="text-xl font-bold">{{@title}}</h5>
        </LinkTo>
        <Button
          @label={{@collapseLabel}}
          @icon={{faAnglesLeft}}
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

      <div class="flex-grow overflow-y-auto pe-3">
        <Nav @isPills={{true}} @isVertical={{true}} aria-label="Main nav">
          {{yield (hash item=AsideItem group=AsideGroup title=AsideTitle)}}
        </Nav>
      </div>

      {{#if (has-block "footerNav")}}
        <div class="pe-3">
          <Nav @isPills={{true}} @isVertical={{true}} aria-label="Footer nav">
            {{yield (hash item=AsideItem) to="footerNav"}}
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
