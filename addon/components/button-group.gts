import { concat, hash } from '@ember/helper';
import Button from './button';
import type { TOC } from '@ember/component/template-only';

export interface ButtonGroupSignature {
  Args: {
    size?: 'sm' | 'lg';
  };
  Blocks: {
    default: [{ button: typeof Button }];
  };
  Element: HTMLDivElement;
}

const ButtonGroup: TOC<ButtonGroupSignature> = <template>
  <div
    class="btn-group {{if @size (concat 'btn-group-' @size)}}"
    role="group"
    data-test-button-group
    ...attributes
  >
    {{yield (hash button=Button)}}
  </div>
</template>;

export default ButtonGroup;
