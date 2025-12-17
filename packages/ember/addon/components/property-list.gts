import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import type { WithBoundArgs } from '@glint/template';
import PropertyListItem from './property-list/item';

export interface PropertyListSignature {
  Args: {
    noLabel: string;
    copyLabel: string;
    copiedLabel: string;
    title?: string;
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [
      {
        item: WithBoundArgs<
          typeof PropertyListItem,
          'noLabel' | 'copyLabel' | 'copiedLabel' | 'isHorizontal'
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
            PropertyListItem
            noLabel=@noLabel
            copyLabel=@copyLabel
            copiedLabel=@copiedLabel
            isHorizontal=@isHorizontal
          )
        )
      }}
    </dl>
  </div>
</template>;

export default PropertyList;
