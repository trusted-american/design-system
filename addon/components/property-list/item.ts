import Component from '@glimmer/component';

export interface PropertyListItemComponentSignature {
  Element: HTMLElement;
  Args: {
    key: string | number;
    value?: unknown;
    alt?: unknown;
    tooltip?: string;
    horizontal?: boolean;
  };
  Blocks: {
    default: [];
  };
}

export default class PropertyListItemComponent extends Component<PropertyListItemComponentSignature> {}
