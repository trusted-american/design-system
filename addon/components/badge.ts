import Component from '@glimmer/component';

export interface BadgeSignature {
  Args: {
    text?: string;
    color?: string;
    icon?: string;
    isPill?: boolean;
    isLoading?: boolean;
  };
  Element: HTMLElement;
}

export default class Badge extends Component<BadgeSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Badge: typeof Badge;
  }
}
