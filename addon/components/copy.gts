import Component from '@glimmer/component';
import CopyButtonClipboard from './copy-button-clipboard';

export interface CopySignature {
  Args: {
    label: string;
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

export default class Copy extends Component<CopySignature> {
  <template>
    <CopyButtonClipboard
      @text={{@label}}
      @container={{@container}}
      @delegateClickEvent={{@delegateClickEvent}}
      class="{{if @isButton 'btn btn-secondary'}} {{if @isFullWidth 'w-100'}}"
      data-test-copy
      ...attributes
    >
      {{yield}}
    </CopyButtonClipboard>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Copy: typeof Copy;
  }
}
