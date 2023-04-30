import Component from '@glimmer/component';
import BsPlaceholder from 'ember-simple-bootstrap/components/bs/placeholder';

export interface SkeletonSignature {
  Element: HTMLElement;
}

export default class Skeleton extends Component<SkeletonSignature> {
  <template>
    <BsPlaceholder ...attributes />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Skeleton: typeof Skeleton;
  }
}
