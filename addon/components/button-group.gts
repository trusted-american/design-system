import { concat } from '@ember/helper';

import type { TOC } from '@ember/component/template-only';

export interface ButtonGroupSignature {
  Args: {
    size?: 'sm' | 'lg';
  };
  Blocks: {
    default: [];
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
    {{yield}}
  </div>
</template>;

export default ButtonGroup;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ButtonGroup: typeof ButtonGroup;
  }
}
