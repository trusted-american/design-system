import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import DropdownItem from './dropdown/item';
import DropdownDivider from './dropdown/divider';

export interface DropdownSignature {
  Blocks: {
    default: [{ item: typeof DropdownItem; divider: typeof DropdownDivider }];
  };
  Element: HTMLDivElement;
}

const Dropdown: TOC<DropdownSignature> = <template>
  <div
    class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow-sm w-44 absolute"
    data-test-dropdown
    ...attributes
  >
    {{yield (hash item=DropdownItem divider=DropdownDivider)}}
  </div>
</template>;

export default Dropdown;
