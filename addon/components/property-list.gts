import Component from '@glimmer/component';
import { hash } from '@ember/helper';
import PropertyListItem from './property-list/item';

import type { WithBoundArgs } from '@glint/template';

export interface PropertyListSignature {
  Args: {
    title?: string;
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [
      {
        item: WithBoundArgs<typeof PropertyListItem, 'isHorizontal'>;
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class PropertyList extends Component<PropertyListSignature> {
  <template>
    <div data-test-property-list ...attributes>
      {{#if @title}}
        <p class="text-uppercase">
          {{@title}}
        </p>
      {{/if}}
      <dl class="row {{if @isHorizontal 'gx-5'}} mb-0">
        {{yield
          (hash item=(component PropertyListItem isHorizontal=@isHorizontal))
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
