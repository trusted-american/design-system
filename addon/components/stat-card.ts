import Component from '@glimmer/component';

export interface StatCardComponentSignature {
  Element: HTMLDivElement;
  Args: {
    key: string;
    value: unknown;
  };
}

export default class StatCardComponent extends Component<StatCardComponentSignature> {}
