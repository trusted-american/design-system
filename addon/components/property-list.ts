import Component from '@glimmer/component';

import type { WithBoundArgs } from '@glint/template';
import type PropertyListItem from './property-list/item';

export interface PropertyListSignature {
  Args: {
    title?: string;
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [
      {
        item: WithBoundArgs<typeof PropertyListItem, 'isHorizontal'>;
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class PropertyList extends Component<PropertyListSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    PropertyList: typeof PropertyList;
  }
}
