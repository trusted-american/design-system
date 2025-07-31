import type { TOC } from '@ember/component/template-only';

export interface CardHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const CardHeader: TOC<CardHeaderSignature> = <template>
  <div class="px-4 py-2 bg-gray-100 border-b" ...attributes>
    {{yield}}
  </div>
</template>;

export default CardHeader;
