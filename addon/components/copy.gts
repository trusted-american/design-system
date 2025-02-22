import CopyButtonClipboard from './copy-button-clipboard';

import type { TOC } from '@ember/component/template-only';

export interface CopySignature {
  Args: {
    value: string;
    container?: string | Element;
    delegateClickEvent?: boolean;
    isButton?: boolean;
    isFullWidth?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLButtonElement;
}

const Copy: TOC<CopySignature> = <template>
  <CopyButtonClipboard
    @text={{@value}}
    @container={{@container}}
    @delegateClickEvent={{@delegateClickEvent}}
    class="{{if @isButton 'btn btn-secondary'}} {{if @isFullWidth 'w-100'}}"
    data-test-copy
    ...attributes
  >
    {{yield}}
  </CopyButtonClipboard>
</template>;

export default Copy;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Copy: typeof Copy;
  }
}
