import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import CardBody from './card/body.gts';
import CardFooter from './card/footer.gts';
import CardHeader from './card/header.gts';

export interface CardSignature {
  Blocks: {
    default: [
      {
        header: typeof CardHeader;
        body: typeof CardBody;
        footer: typeof CardFooter;
      },
    ];
  };
  Element: HTMLDivElement;
}

const Card: TOC<CardSignature> = <template>
  <div class="card" data-test-card ...attributes>
    {{yield (hash header=CardHeader body=CardBody footer=CardFooter)}}
  </div>
</template>;

export default Card;
