import type { TOC } from '@ember/component/template-only';
import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import tooltip from '../../../modifiers/tooltip.ts';
import Icon from '../../icon.gts';

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
        <Icon @icon={{faInfoCircle}} {{tooltip @help}} />
      </a>
    {{/if}}
  </dt>
</template>;

export default PropertyListItemKey;
