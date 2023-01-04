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

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    PropertyList: typeof PropertyListComponent;
  }
}
