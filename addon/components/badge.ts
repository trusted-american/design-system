import Component from '@glimmer/component';

export interface BadgeComponentSignature {
  Element: HTMLElement;
  Args: {
    text: string;
    color?: string;
    icon?: string;
  };
}

export default class BadgeComponent extends Component<BadgeComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Badge: typeof BadgeComponent;
  }
}
