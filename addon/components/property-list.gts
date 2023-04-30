import Component from '@glimmer/component';
import { hash } from '@ember/helper';
import PropertyListItem from './property-list/item';

import type { WithBoundArgs } from '@glint/template';

export interface PropertyListSignature {
  Element: HTMLDivElement;
  Args: {
    title?: string;
    horizontal?: boolean;
  };
  Blocks: {
    default: [{ item: WithBoundArgs<typeof PropertyListItem, 'horizontal'> }];
  };
}

export default class PropertyList extends Component<PropertyListSignature> {
  <template>
    <div ...attributes>
      {{#if @title}}
        <p class='text-uppercase'>
          {{@title}}
        </p>
      {{/if}}
      <dl class='row {{if @horizontal "gx-5"}} mb-0'>
        {{yield
          (hash item=(component PropertyListItem horizontal=@horizontal))
        }}
      </dl>
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    PropertyList: typeof PropertyList;
  }
}
