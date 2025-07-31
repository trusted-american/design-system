import Icon from '../../icon';
import tooltip from '../../../modifiers/tooltip';
import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import type { TOC } from '@ember/component/template-only';

export interface PropertyListItemKeySignature {
  Args: {
    label: string;
    help?: string;
  };
  Element: HTMLElement;
}

const PropertyListItemKey: TOC<PropertyListItemKeySignature> = <template>
  <dt class="text-gray-500" ...attributes>
    {{@label}}
    {{#if @help}}
      <a href="#" class="text-gray-500 ms-1">
        <Icon @icon={{faInfoCircle}} {{tooltip @help}} />
      </a>
    {{/if}}
  </dt>
</template>;

export default PropertyListItemKey;
