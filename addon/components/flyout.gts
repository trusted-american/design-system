import Component from '@glimmer/component';
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
  <template>
    <div
      class="offcanvas offcanvas-end"
      tabindex="-1"
      data-test-flyout
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
