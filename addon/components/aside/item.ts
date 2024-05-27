import Component from '@glimmer/component';

import type { LinkToArgs } from '../button';

interface Args extends LinkToArgs {
  text: string;
  icon?: string;
}

export interface AsideItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class AsideItem extends Component<AsideItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Item': typeof AsideItem;
  }
}
