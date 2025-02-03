import Component from '@glimmer/component';

export interface PropertyListItemSignature {
  Args: {
    value: string | null;
    label: string;
    help?: string;
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [];
    side: [];
  };
  Element: HTMLElement;
}

export default class PropertyListItem extends Component<PropertyListItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item': typeof PropertyListItem;
    'property-list/item': typeof PropertyListItem;
  }
}
