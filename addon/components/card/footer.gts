import type { TOC } from '@ember/component/template-only';

export interface CardFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const CardFooter: TOC<CardFooterSignature> = <template>
  <div class="px-4 py-2 bg-gray-100 border-top" ...attributes>
    {{yield}}
  </div>
</template>;

export default CardFooter;
