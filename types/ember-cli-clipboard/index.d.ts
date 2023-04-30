declare module 'ember-cli-clipboard/components/copy-button' {
  import Component from '@glimmer/component';

  export default class CopyButton extends Component<{
    Element: HTMLElement;
    Args: {
      text: unknown;
      delegateClickEvent?: boolean;
    };
    Blocks: {
      default: [];
    };
  }> {}
}
