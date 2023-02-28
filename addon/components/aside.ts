import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

export interface AsideComponentSignature {
  Args: {
    title: string;
    logo: string;
    route: string;
  };
  Blocks: {
    default: [];
    lower: [];
    bottom: [];
  };
}

export default class AsideComponent extends Component<AsideComponentSignature> {
  @tracked collapsed = false;
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Aside: typeof AsideComponent;
  }
}
