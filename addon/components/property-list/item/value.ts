import Component from '@glimmer/component';

export interface PropertyListItemValueSignature {
  Args: {
    value: string | number | boolean | Date | null;
    label: string;
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
