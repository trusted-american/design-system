declare module '@fortawesome/ember-fontawesome/components/fa-icon' {
  import Component from '@glimmer/component';

  export default class FaIcon extends Component<{
    Element: HTMLElement;
    Args: {
      icon: string;
      fixedWidth?: boolean;
      size?: string;
      prefix?: string;
      transform?: string;
    };
  }> {}
}
