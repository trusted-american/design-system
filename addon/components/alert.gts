import type { TOC } from '@ember/component/template-only';
import { get } from '@ember/helper';
import { on } from '@ember/modifier';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { and, or } from 'ember-truth-helpers';
import CloseButton from './close-button';
import Icon from './icon';

const colorVariants = {
  primary: 'bg-blue-50 text-blue-800 border-blue-300',
  secondary: 'bg-gray-50 text-gray-800 border-gray-300',
  success: 'bg-green-50 text-green-800 border-green-300',
  danger: 'bg-red-50 text-red-800 border-red-300',
  warning: 'bg-yellow-50 text-yellow-800 border-yellow-300',
  info: 'bg-sky-50 text-sky-800 border-sky-300',
  light: '',
  dark: '',
};

interface Args {
  color?: string;
  icon?: IconDefinition;
}

interface DefaultArgs extends Args {
  closeButtonLabel?: never;
  onClose?: never;
}

interface CloseableArgs extends Args {
  closeButtonLabel: string;
  onClose: () => void;
}

export interface AlertSignature {
  Args: DefaultArgs | CloseableArgs;
  Blocks: {
    title: [];
    default: [];
  };
  Element: HTMLDivElement;
}

const Alert: TOC<AlertSignature> = <template>
  <div
    class="flex items-center p-4 mb-4 border rounded-lg
      {{get colorVariants (or @color 'secondary')}}
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
