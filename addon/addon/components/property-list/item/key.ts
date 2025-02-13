import Component from '@glimmer/component';

export interface PropertyListItemKeySignature {
  Args: {
    label: string;
    help?: string;
  };
  Element: HTMLElement;
}

export default class PropertyListItemKey extends Component<PropertyListItemKeySignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item::Key': typeof PropertyListItemKey;
  }
}
