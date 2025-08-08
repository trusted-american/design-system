import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import DropdownDivider from './dropdown/divider';
import DropdownItem from './dropdown/item';

export interface DropdownSignature {
  Blocks: {
    default: [{ item: typeof DropdownItem; divider: typeof DropdownDivider }];
  };
  Element: HTMLDivElement;
}

const Dropdown: TOC<DropdownSignature> = <template>
  <div
    class="absolute z-10 hidden bg-white rounded-lg border py-2"
    data-test-dropdown
    ...attributes
  >
    {{yield (hash item=DropdownItem divider=DropdownDivider)}}
  </div>
</template>;

export default Dropdown;
