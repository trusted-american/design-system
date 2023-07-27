import Component from '@glimmer/component';

export interface BadgeSignature {
  Element: HTMLElement;
  Args: {
    text: string;
    color?: string;
    icon?: string;
  };
}

export default class Badge extends Component<BadgeSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Badge: typeof Badge;
  }
}
