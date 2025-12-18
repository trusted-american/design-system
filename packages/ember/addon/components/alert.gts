import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import { on } from '@ember/modifier';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { and } from 'ember-truth-helpers';
import AlertLink from './alert/link';
import CloseButton from './close-button';
import Icon from './icon';

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
    default: [{ link: typeof AlertLink }];
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
      {{yield (hash link=AlertLink)}}
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
