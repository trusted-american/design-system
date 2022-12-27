import Component from '@glimmer/component';

import type PropertyListItemComponent from './property-list/item';

export interface PropertyListComponentSignature {
  Element: HTMLDivElement;
  Args: {
    title?: string;
    horizontal?: boolean;
  };
  Blocks: {
    default: [{ item: typeof PropertyListItemComponent }];
  };
}

export default class PropertyListComponent extends Component<PropertyListComponentSignature> {}
