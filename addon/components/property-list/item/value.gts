import { concat } from '@ember/helper';
import { action } from '@ember/object';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { eq, or } from 'ember-truth-helpers';
import tooltip from '../../../modifiers/tooltip';
import Copy from '../../copy';

export interface PropertyListItemValueSignature {
  Args: {
    value: string | number | boolean | null | undefined;
    label: string;
    noLabel: string;
    copyLabel: string;
    copiedLabel: string;
    isStatic?: boolean;
  };
  Blocks: {
    default: [];
    trailing: [];
  };
  Element: HTMLElement;
}

export default class PropertyListItemValue extends Component<PropertyListItemValueSignature> {
  timeout?: number;

  @tracked isCopied = false;

  @action
  copy() {
    this.isCopied = true;

    clearTimeout(this.timeout);

    this.timeout = setTimeout(() => {
      this.isCopied = false;
    }, 5000);
  }

  <template>
    <dd class="d-flex justify-content-between" ...attributes>
      {{#if (or @value (eq false @value) (eq 0 @value))}}
        {{#if @isStatic}}
          {{yield}}
        {{else}}
          <Copy
            @value="{{@value}}"
            @onSuccess={{this.copy}}
            {{tooltip
              (if this.isCopied @copiedLabel (concat @copyLabel " " @label))
            }}
          >
            {{yield}}
          </Copy>
        {{/if}}
        {{#if (has-block "trailing")}}
          <div>{{yield to="trailing"}}</div>
        {{/if}}
      {{else}}
        <span class="text-disabled">
          {{@noLabel}}
          {{@label}}
        </span>
      {{/if}}
    </dd>
  </template>
}
