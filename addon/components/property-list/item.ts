import Component from '@glimmer/component';

export interface PropertyListItemComponentSignature {
  Element: HTMLElement;
  Args: {
    key: string | number;
    value?: unknown;
    alt?: unknown;
    tooltip?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class PropertyListItemComponent extends Component<PropertyListItemComponentSignature> {}
