import Component from '@glimmer/component';

export interface StatCardSignature {
  Args: {
    label: string;
    value?: string | number | null;
    icon?: string;
    route?: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class StatCard extends Component<StatCardSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    StatCard: typeof StatCard;
  }
}
