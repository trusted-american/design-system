import { on } from '@ember/modifier';
import {
  faCheck,
  faCircleExclamation,
  faCircleInfo,
  faTriangleExclamation,
} from '@fortawesome/free-solid-svg-icons';
import Component from '@glimmer/component';
import { eq } from 'ember-truth-helpers';
import CloseButton from './close-button';
import Icon from './icon';

export interface ToastSignature {
  Args: {
    color?: string;
    closeButtonLabel: string;
    onClose?: () => void;
  };
  Blocks: {
    title: [];
    body: [];
    buttons: [];
  };
}

export default class Toast extends Component<ToastSignature> {
  <template>
    <div class="z-50 max-w-sm w-full mt-3" data-test-toast>
      <div
        class="bg-white border border-gray-200 shadow-lg rounded-lg p-4 flex items-start space-x-4"
      >
        {{#if @color}}
          <div class="flex-shrink-0">
            <Icon
              @icon={{if
                (eq "success" @color)
                faCheck
                (if
                  (eq "danger" @color)
                  faTriangleExclamation
                  (if
                    (eq "warning" @color)
                    faCircleExclamation
                    (if (eq "info" @color) faCircleInfo faCheck)
                  )
                )
              }}
              class="h-6 w-6
                {{if
                  (eq 'success' @color)
                  'text-green-500'
                  (if
                    (eq 'danger' @color)
                    'text-red-500'
                    (if
                      (eq 'warning' @color)
                      'text-yellow-500'
                      (if (eq 'info' @color) 'text-sky-500')
                    )
                  )
                }}"
            />
          </div>
        {{/if}}

        <div class="flex-1">
          {{#if (has-block "title")}}
            <h4 class="text-sm font-semibold text-gray-800 mb-1">
              {{yield to="title"}}
            </h4>
          {{/if}}
          <p class="text-sm text-gray-600">
            {{yield to="body"}}
          </p>
          {{#if (has-block "buttons")}}
            <div class="mt-2 pt-2 border-top">
              {{yield to="buttons"}}
            </div>
          {{/if}}
        </div>

        {{#if @onClose}}
          <CloseButton @label={{@closeButtonLabel}} {{on "click" @onClose}} />
        {{/if}}
      </div>
    </div>
  </template>
}
