import Icon from './icon';
import CloseButton from './close-button';
import { on } from '@ember/modifier';
import { and, eq } from 'ember-truth-helpers';
import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';

interface Args {
  color?: string;
  icon?: IconDefinition;
}

interface Args1 extends Args {
  closeButtonLabel?: never;
  onClose?: never;
}

interface Args2 extends Args {
  closeButtonLabel: string;
  onClose: () => void;
}

export interface AlertSignature {
  Args: Args1 | Args2;
  Blocks: {
    title: [];
    default: [];
  };
  Element: HTMLDivElement;
}

const Alert: TOC<AlertSignature> = <template>
  <div
    class="flex items-center p-4 mb-4 text-sm border rounded-lg
      {{if
        (eq 'primary' @color)
        'text-blue-800 bg-blue-50 border-blue-300'
        (if
          (eq 'success' @color)
          'text-green-800 bg-green-50 border-green-300'
          (if
            (eq 'danger' @color)
            'text-red-800 bg-red-50 border-red-300'
            (if
              (eq 'warning' @color)
              'text-yellow-800 bg-yellow-50 border-yellow-300'
              (if
                (eq 'info' @color)
                'text-sky-800 bg-sky-50 border-sky-300'
                'text-gray-800 bg-gray-50 border-gray-300'
              )
            )
          )
        )
      }}
      {{if @onClose 'alert-dismissible'}}"
    role="alert"
    data-test-alert
    ...attributes
  >
    {{#if @icon}}
      <Icon @icon={{@icon}} class="shrink-0 inline w-4 h-4 me-3" />
    {{/if}}
    <div>
      {{#if (has-block "title")}}
        <h6 class="font-bold">{{yield to="title"}}</h6>
      {{/if}}
      {{yield}}
    </div>
    {{#if (and @closeButtonLabel @onClose)}}
      <CloseButton
        @label={{@closeButtonLabel}}
        data-bs-dismiss="alert"
        {{on "click" @onClose}}
      />
    {{/if}}
  </div>
</template>;

export default Alert;
