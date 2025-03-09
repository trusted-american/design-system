import type { TOC } from '@ember/component/template-only';

export interface FrameSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const Frame: TOC<FrameSignature> = <template>
  <div class="tds-frame" ...attributes>
    {{yield}}
  </div>
</template>;

export default Frame;
