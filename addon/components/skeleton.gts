import Component from '@glimmer/component';
import BsPlaceholder from 'ember-simple-bootstrap/components/bs/placeholder';

export interface SkeletonComponentSignature {
  Element: HTMLElement;
}

export default class SkeletonComponent extends Component<SkeletonComponentSignature> {
  <template>
    <BsPlaceholder ...attributes />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Skeleton: typeof SkeletonComponent;
  }
}
