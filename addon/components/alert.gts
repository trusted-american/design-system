import Icon from './icon';
import CloseButton from './close-button';
import { on } from '@ember/modifier';
import { and } from 'ember-truth-helpers';
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
    class="alert alert-{{if @color @color 'secondary'}}
      {{if @onClose 'alert-dismissible'}}
      d-flex gap-3"
    role="alert"
    data-test-alert
    ...attributes
  >
    {{#if @icon}}
      <div>
        <Icon @icon={{@icon}} />
      </div>
    {{/if}}
    <div>
      {{#if (has-block "title")}}
        <h6 class="alert-heading">{{yield to="title"}}</h6>
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
