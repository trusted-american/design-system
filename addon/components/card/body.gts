import type { TOC } from '@ember/component/template-only';

export interface CardBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const CardBody: TOC<CardBodySignature> = <template>
  <div class="p-4" ...attributes>
    {{yield}}
  </div>
</template>;

export default CardBody;
