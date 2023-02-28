import Component from '@glimmer/component';

export interface StatCardComponentSignature {
  Element: HTMLDivElement;
  Args: {
    key: string;
    value: string | number | null | undefined;
  };
}

export default class StatCardComponent extends Component<StatCardComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    StatCard: typeof StatCardComponent;
  }
}
