import Component from '@glimmer/component';

import type { LinkToArgs } from './button';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

interface Args extends LinkToArgs {
  label: string;
  value?: string | number | null;
  icon?: IconName;
}

export interface StatCardSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class StatCard extends Component<StatCardSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    StatCard: typeof StatCard;
  }
}
