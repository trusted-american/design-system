import Component from '@glimmer/component';

export interface StatCardSignature {
  Element: HTMLDivElement;
  Args: {
    key: string;
    value: string | number | null | undefined;
  };
}

export default class StatCard extends Component<StatCardSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    StatCard: typeof StatCard;
  }
}
