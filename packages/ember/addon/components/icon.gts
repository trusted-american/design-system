import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import type {
  IconDefinition,
  SizeProp,
} from '@fortawesome/fontawesome-svg-core';
import type { Color } from '@trusted-american/core';

export interface IconSignature {
  Args: {
    icon: IconDefinition;
    color?: Color;
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
    class={{if @color (concat "text-" @color)}}
    data-test-icon
    ...attributes
  />
</template>;

export default Icon;
