import Component from '@glimmer/component';
import Button from './button';
import Nav from './nav';
import tooltip from '../modifiers/tooltip';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
import { LinkTo } from '@ember/routing';

export interface AsideSignature {
  Args: {
    title: string;
    logo: string;
    route: string;
    isCollapsed: boolean;
    onChange: (isCollapsed: boolean) => void;
  };
  Blocks: {
    header: [];
    default: [];
    footerNav: [];
    footer: [];
  };
}

export default class Aside extends Component<AsideSignature> {
  <template>
    <aside
      class="d-flex flex-column flex-shrink-0 overflow-y-auto border-end gap-3 py-3 ps-3
        {{if @isCollapsed 'collapsed'}}"
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
          @label="Collapse menu"
          @icon="angles-left"
          @color="none"
          @isIconOnly={{true}}
          {{tooltip "Collapse menu" trigger="hover"}}
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
          {{yield}}
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
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Aside: typeof Aside;
  }
}
