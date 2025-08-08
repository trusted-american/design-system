import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import CardBody from './card/body';
import CardFooter from './card/footer';
import CardHeader from './card/header';

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
  <div class="border rounded-lg" data-test-card ...attributes>
    {{yield (hash header=CardHeader body=CardBody footer=CardFooter)}}
  </div>
</template>;

export default Card;
