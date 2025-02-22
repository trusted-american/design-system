import Icon from '../../icon';
import tooltip from '../../../modifiers/tooltip';

import type { TOC } from '@ember/component/template-only';

export interface PropertyListItemKeySignature {
  Args: {
    label: string;
    help?: string;
  };
  Element: HTMLElement;
}

const PropertyListItemKey: TOC<PropertyListItemKeySignature> = <template>
  <dt class="text-secondary" ...attributes>
    {{@label}}
    {{#if @help}}
      <a href="#" class="text-secondary ms-1">
        <Icon @icon="info-circle" {{tooltip @help}} />
      </a>
    {{/if}}
  </dt>
</template>;

export default PropertyListItemKey;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item::Key': typeof PropertyListItemKey;
  }
}
