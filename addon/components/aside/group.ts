import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';

export interface AsideGroupSignature {
  Args: {
    text: string;
    icon?: string;
    route: string;
  };
  Blocks: {
    default: [];
  };
}

export default class AsideGroup extends Component<AsideGroupSignature> {
  id = guidFor(this);
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Group': typeof AsideGroup;
  }
}
