import Component from '@glimmer/component';
import Copy from '../../copy';
import tooltip from '../../../modifiers/tooltip';
import { concat } from '@ember/helper';

export interface PropertyListItemValueSignature {
  Args: {
    value: unknown;
    label: string;
    isStatic?: boolean;
  };
  Blocks: {
    default: [];
    side: [];
  };
  Element: HTMLElement;
}

export default class PropertyListItemValue extends Component<PropertyListItemValueSignature> {
  <template>
    <dd class="d-flex justify-content-between" ...attributes>
      {{#if (or @value (eq false @value) (eq 0 @value))}}
        {{#if @isStatic}}
          {{yield}}
        {{else}}
          <Copy @label="{{@value}}" {{tooltip (concat "Copy " @label)}}>
            {{yield}}
          </Copy>
        {{/if}}
        {{#if (has-block "side")}}
          <div>{{yield to="side"}}</div>
        {{/if}}
      {{else}}
        {{! TODO: class dne }}
        <span class="text-disabled">
          {{! TODO: string }}
          No
          {{@label}}
        </span>
      {{/if}}
    </dd>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item::Value': typeof PropertyListItemValue;
  }
}
