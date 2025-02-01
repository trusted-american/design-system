import Component from '@glimmer/component';

export interface PropertyListItemValueSignature {
  Args: {
    value: string | null;
    label: string;
    alt?: unknown;
  };
  Blocks: {
    default: [];
    side: [];
  };
  Element: HTMLElement;
}

export default class PropertyListItemValue extends Component<PropertyListItemValueSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item::Value': typeof PropertyListItemValue;
  }
}
