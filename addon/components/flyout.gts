import Component from '@glimmer/component';
import { Offcanvas } from 'bootstrap';
import { modifier } from 'ember-modifier';
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

  setup = modifier((element) => {
    // TODO: fixes issue where offcanvas traps focus preventing selecting of power select search
    // @ts-expect-error private member
    Offcanvas.prototype._initializeFocusTrap = () => {
      // eslint-disable-next-line @typescript-eslint/no-empty-function
      return { activate: () => {}, deactivate: () => {} };
    };

    this.offcanvas = new Offcanvas(element);
    this.offcanvas.show();

    const { onClose } = this.args;
    element.addEventListener('hidden.bs.offcanvas', () => {
      onClose();
    });
  });

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
      {{this.setup}}
      ...attributes
    >
      <div class="offcanvas-header border-b">
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
