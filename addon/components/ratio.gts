import Component from '@glimmer/component';
import { concat } from '@ember/helper';

export interface RatioSignature {
  Args: {
    ratio?: '1x1' | '4x3' | '16x9' | '21x9';
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class Ratio extends Component<RatioSignature> {
  <template>
    <div
      class="ratio {{if @ratio (concat 'ratio-' @ratio)}}"
      data-test-ratio
      ...attributes
    >
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Ratio: typeof Ratio;
  }
}
