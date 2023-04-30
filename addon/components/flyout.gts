import Component from '@glimmer/component';
import BsOffcanvas from 'ember-simple-bootstrap/components/bs/offcanvas';

export interface FlyoutSignature {
  Element: HTMLDivElement;
  Args: {
    title: string;
    onClose: () => void;
  };
  Blocks: {
    default: [];
  };
}

export default class Flyout extends Component<FlyoutSignature> {
  <template>
    <BsOffcanvas
      @placement='end'
      @onClose={{@onClose}}
      ...attributes
      as |offcanvas|
    >
      <offcanvas.header @title={{@title}} class='border-bottom' />
      <offcanvas.body>
        {{yield}}
      </offcanvas.body>
    </BsOffcanvas>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Flyout: typeof Flyout;
  }
}
