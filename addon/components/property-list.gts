import PropertyListItem from './property-list/item';
import { hash } from '@ember/helper';

import type { TOC } from '@ember/component/template-only';
import type { WithBoundArgs } from '@glint/template';

export interface PropertyListSignature {
  Args: {
    noLabel: string;
    title?: string;
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [
      {
        item: WithBoundArgs<
          typeof PropertyListItem,
          'noLabel' | 'isHorizontal'
        >;
      },
    ];
  };
  Element: HTMLDivElement;
}

const PropertyList: TOC<PropertyListSignature> = <template>
  <div data-test-property-list ...attributes>
    {{#if @title}}
      <p class="text-uppercase">
        {{@title}}
      </p>
    {{/if}}
    <dl class="row {{if @isHorizontal 'gx-5'}} mb-0">
      {{yield
        (hash
          item=(component
            PropertyListItem noLabel=@noLabel isHorizontal=@isHorizontal
          )
        )
      }}
    </dl>
  </div>
</template>;

export default PropertyList;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    PropertyList: typeof PropertyList;
  }
}
