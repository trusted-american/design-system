import CardHeader from './card/header';
import CardBody from './card/body';
import CardFooter from './card/footer';
import { hash } from '@ember/helper';
import type { TOC } from '@ember/component/template-only';

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
