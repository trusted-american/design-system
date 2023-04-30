import Component from '@glimmer/component';
import BsSpinner from 'ember-simple-bootstrap/components/bs/spinner';

export interface LoaderComponentSignature {
  Element: HTMLDivElement;
}

export default class LoaderComponent extends Component<LoaderComponentSignature> {
  <template>
    <BsSpinner @centered={{true}} ...attributes />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Loader: typeof LoaderComponent;
  }
}
