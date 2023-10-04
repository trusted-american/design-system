import Component from '@glimmer/component';

import type PropertyListItemComponent from './property-list/item';

export interface PropertyListSignature {
  Args: {
    title?: string;
    horizontal?: boolean;
  };
  Blocks: {
    default: [{ item: typeof PropertyListItemComponent }];
  };
  Element: HTMLDivElement;
}

export default class PropertyList extends Component<PropertyListSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    PropertyList: typeof PropertyList;
  }
}
