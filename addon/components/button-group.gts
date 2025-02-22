import Component from '@glimmer/component';
import { concat } from '@ember/helper';

export interface ButtonGroupSignature {
  Args: {
    size?: 'sm' | 'lg';
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class ButtonGroup extends Component<ButtonGroupSignature> {
  <template>
    <div
      class="btn-group {{if @size (concat 'btn-group-' @size)}}"
      role="group"
      data-test-button-group
      ...attributes
    >
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ButtonGroup: typeof ButtonGroup;
  }
}
