import type { TOC } from '@ember/component/template-only';
import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import tooltip from '../../../modifiers/tooltip';
import Icon from '../../icon';

export interface PropertyListItemKeySignature {
  Args: {
    label: string;
    help?: string;
  };
  Element: HTMLElement;
}

const PropertyListItemKey: TOC<PropertyListItemKeySignature> = <template>
  <dt class="text-gray-500 mb-2" ...attributes>
    {{@label}}
    {{#if @help}}
      <a href="#" class="text-gray-500 ms-1">
        <Icon @icon={{faInfoCircle}} {{tooltip @help}} />
      </a>
    {{/if}}
  </dt>
</template>;

export default PropertyListItemKey;
