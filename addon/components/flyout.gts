import Component from '@glimmer/component';
import { Offcanvas } from 'bootstrap';
import { action } from '@ember/object';
import tdsDidInsert from '../modifiers/tds-did-insert';
import CloseButton from './close-button';

export interface FlyoutSignature {
  Args: {
    title: string;
    closeButtonLabel: string;
    onClose: () => void;
  };
  Blocks: {
    default: [];
    footer: [];
  };
  Element: HTMLDivElement;
}

export default class Flyout extends Component<FlyoutSignature> {
  offcanvas?: Offcanvas;

  @action
  didInsert(element: Element): void {
    this.offcanvas = new Offcanvas(element);
    this.offcanvas.show();

    const { onClose } = this.args;
    element.addEventListener('hidden.bs.offcanvas', () => {
      onClose();
    });
  }

  willDestroy(): void {
    super.willDestroy();

    if (this.offcanvas) {
      this.offcanvas.hide();
    }
  }

  <template>
    <div
      class="offcanvas offcanvas-end"
      tabindex="-1"
      data-test-flyout
      ...attributes
      {{tdsDidInsert this.didInsert}}
    >
      <div class="offcanvas-header border-bottom">
        <h6 class="offcanvas-title">{{@title}}</h6>
        <CloseButton
          @label={{@closeButtonLabel}}
          class="text-reset"
          data-bs-dismiss="offcanvas"
        />
      </div>
      <div class="offcanvas-body">
        {{yield}}
      </div>
      {{#if (has-block "footer")}}
        <div class="offcanvas-header border-top">
          {{yield to="footer"}}
        </div>
      {{/if}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Flyout: typeof Flyout;
  }
}
