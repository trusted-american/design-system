import Component from '@glimmer/component';

export interface PropertyListItemSignature {
  Element: HTMLElement;
  Args: {
    key: string | number;
    value?: string | null;
    alt?: unknown;
    tooltip?: string;
    horizontal?: boolean;
  };
  Blocks: {
    default: [];
  };
}

export default class PropertyListItem extends Component<PropertyListItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item': typeof PropertyListItem;
    'property-list/item': typeof PropertyListItem;
  }
}
