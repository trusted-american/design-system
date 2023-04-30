import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { LinkTo } from '@ember/routing';
import Button from './button';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import tooltip from 'ember-simple-bootstrap/modifiers/tooltip';
// @ts-ignore
import not from 'ember-truth-helpers/helpers/not';

export interface AsideComponentSignature {
  Args: {
    title: string;
    logo: string;
    route: string;
  };
  Blocks: {
    default: [];
    lower: [];
    bottom: [];
  };
}

export default class AsideComponent extends Component<AsideComponentSignature> {
  @tracked collapsed = false;

  <template>
    <aside
      class='d-flex flex-column flex-shrink-0 overflow-y-auto p-3
        {{if this.collapsed "collapsed"}}'
    >
      <LinkTo
        @route={{@route}}
        class='d-flex align-items-center link-light text-decoration-none pt-2 pb-4'
      >
        <img src={{@logo}} alt={{@title}} class='tds-aside-logo me-3' />
        <h4 class='mb-0'>{{@title}}</h4>
      </LinkTo>

      <nav class='nav nav-pills flex-column flex-grow-1' aria-label='Upper Nav'>
        {{yield}}
      </nav>

      <nav class='nav nav-pills flex-column' aria-label='Lower Nav'>
        {{yield to='lower'}}
      </nav>

      {{#if (has-block 'bottom')}}
        <div class='pt-3'>
          {{yield to='bottom'}}
        </div>
      {{/if}}

      <div class='pt-3'>
        <Button
          @text='Toggle menu'
          @icon='toggle-{{if this.collapsed "off" "on"}}'
          @iconOnly={{true}}
          @color='dark'
          class='px-2'
          {{tooltip 'Toggle menu' trigger='hover' placement='right'}}
          {{on 'click' (fn (mut this.collapsed) (not this.collapsed))}}
        />
      </div>
    </aside>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Aside: typeof AsideComponent;
  }
}
