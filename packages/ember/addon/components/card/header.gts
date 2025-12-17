import type { TOC } from '@ember/component/template-only';

export interface CardHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const CardHeader: TOC<CardHeaderSignature> = <template>
  <div class="card-header" ...attributes>
    {{yield}}
  </div>
</template>;

export default CardHeader;
