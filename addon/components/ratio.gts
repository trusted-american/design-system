import type { TOC } from '@ember/component/template-only';
import { eq } from 'ember-truth-helpers';

export interface RatioSignature {
  Args: {
    ratio?: '1x1' | '4x3' | '16x9' | '21x9';
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const Ratio: TOC<RatioSignature> = <template>
  <div
    class={{if
      (eq "1x1" @ratio)
      "aspect-square"
      (if
        (eq "4x3" @ratio)
        "aspect-4/3"
        (if
          (eq "16x9" @ratio)
          "aspect-video"
          (if (eq "21x9" @ratio) "aspect-21/9")
        )
      )
    }}
    data-test-ratio
    ...attributes
  >
    {{yield}}
  </div>
</template>;

export default Ratio;
