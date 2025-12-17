import type { TOC } from '@ember/component/template-only';

export interface CardFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const CardFooter: TOC<CardFooterSignature> = <template>
  <div class="card-footer" ...attributes>
    {{yield}}
  </div>
</template>;

export default CardFooter;
