import Component from '@glimmer/component';

export default class CopyButton extends Component<{
  Args: {
    text: unknown;
    delegateClickEvent?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}> {}
