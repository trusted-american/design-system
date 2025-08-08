import type { TOC } from '@ember/component/template-only';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import type {
  IconDefinition,
  SizeProp,
} from '@fortawesome/fontawesome-svg-core';
import { eq } from 'ember-truth-helpers';

export interface IconSignature {
  Args: {
    icon: IconDefinition;
    color?: string;
    isFixedWidth?: boolean;
    size?: SizeProp;
    transform?: string;
  };
  Element: SVGElement;
}

const Icon: TOC<IconSignature> = <template>
  <FaIcon
    @icon={{@icon}}
    @fixedWidth={{@isFixedWidth}}
    @size={{@size}}
    @transform={{@transform}}
    class={{if
      (eq "primary" @color)
      "text-blue-500"
      (if
        (eq "success" @color)
        "text-green-500"
        (if
          (eq "danger" @color)
          "text-red-500"
          (if
            (eq "warning" @color)
            "text-yellow-500"
            (if (eq "info" @color) "text-sky-500")
          )
        )
      )
    }}
    data-test-icon
    ...attributes
  />
</template>;

export default Icon;
