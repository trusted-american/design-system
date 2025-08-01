import type { TOC } from '@ember/component/template-only';
import { faTimes } from '@fortawesome/free-solid-svg-icons';
import Icon from './icon';

export interface CloseButtonSignature {
  Args: {
    label: string;
  };
  Element: HTMLButtonElement;
}

const CloseButton: TOC<CloseButtonSignature> = <template>
  <button
    type="button"
    aria-label={{@label}}
    data-test-close-button
    ...attributes
  >
    <Icon @icon={{faTimes}} />
  </button>
</template>;

export default CloseButton;
