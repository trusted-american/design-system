import type { TOC } from '@ember/component/template-only';

export interface CardBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const CardBody: TOC<CardBodySignature> = <template>
  <div class="card-body" ...attributes>
    {{yield}}
  </div>
</template>;

export default CardBody;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Card::Body': typeof CardBody;
  }
}
