import Component from '@glimmer/component';

import type PropertyListItem from './property-list/item';
import type { WithBoundArgs } from '@glint/template';

export interface PropertyListSignature {
  Element: HTMLDivElement;
  Args: {
    title?: string;
    horizontal?: boolean;
  };
  Blocks: {
    default: [{ item: WithBoundArgs<typeof PropertyListItem, 'horizontal'> }];
  };
}

export default class PropertyList extends Component<PropertyListSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    PropertyList: typeof PropertyList;
  }
}
