import { hash } from '@ember/helper';
import Button from './button';

import type { TOC } from '@ember/component/template-only';

export interface ButtonSetSignature {
  Blocks: {
    default: [{ button: typeof Button }];
  };
  Element: HTMLDivElement;
}

const ButtonSet: TOC<ButtonSetSignature> = <template>
  <div class="d-flex gap-2" data-test-button-set ...attributes>
    {{yield (hash button=Button)}}
  </div>
</template>;

export default ButtonSet;
