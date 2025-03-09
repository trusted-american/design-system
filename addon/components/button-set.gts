import type { TOC } from '@ember/component/template-only';

export interface ButtonSetSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const ButtonSet: TOC<ButtonSetSignature> = <template>
  <div class="d-flex gap-2" data-test-button-set ...attributes>
    {{yield}}
  </div>
</template>;

export default ButtonSet;
