import Component from '@glimmer/component';
import CloseButton from './close-button';
import { on } from '@ember/modifier';

export interface ModalSignature {
  Args: {
    title: string;
    size?: 'sm' | 'lg' | 'xl';
    isStatic?: boolean;
    isKeyboard?: boolean;
    isFocus?: boolean;
    isFullscreen?: boolean;
    hideClose?: boolean;
    closeButtonLabel: string;
    onClose: () => void;
  };
  Blocks: {
    default: [() => void];
    footer: [() => void];
  };
  Element: HTMLDivElement;
}

export default class Modal extends Component<ModalSignature> {
  <template>
    <div
      class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
      tabindex="-1"
      data-test-modal
      ...attributes
    >
      <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6">
        <div class="flex justify-between items-center border-b pb-3">
          <h3 class="text-lg font-semibold text-gray-800">{{@title}}</h3>
          {{#unless @hideClose}}
            <CloseButton @label={{@closeButtonLabel}} {{on "click" @onClose}} />
          {{/unless}}
        </div>
        <div class="mt-4 text-gray-600">
          {{yield @onClose}}
        </div>
        {{#if (has-block "footer")}}
          <div class="mt-6 flex justify-end space-x-2">
            {{yield @onClose to="footer"}}
          </div>
        {{/if}}
      </div>
    </div>
  </template>
}
