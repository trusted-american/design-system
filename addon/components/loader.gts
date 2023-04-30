import Component from '@glimmer/component';
import BsSpinner from 'ember-simple-bootstrap/components/bs/spinner';

export interface LoaderSignature {
  Element: HTMLDivElement;
}

export default class Loader extends Component<LoaderSignature> {
  <template>
    <BsSpinner @centered={{true}} ...attributes />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Loader: typeof Loader;
  }
}
