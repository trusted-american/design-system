import Copy from '../../copy';
import tooltip from '../../../modifiers/tooltip';
import { concat } from '@ember/helper';
import { eq, or } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';

export interface PropertyListItemValueSignature {
  Args: {
    value: string | number | boolean | null | undefined;
    label: string;
    noLabel: string;
    isStatic?: boolean;
  };
  Blocks: {
    default: [];
    trailing: [];
  };
  Element: HTMLElement;
}

const PropertyListItemValue: TOC<PropertyListItemValueSignature> = <template>
  <dd class="d-flex justify-content-between" ...attributes>
    {{#if (or @value (eq false @value) (eq 0 @value))}}
      {{#if @isStatic}}
        {{yield}}
      {{else}}
        <Copy @value="{{@value}}" {{tooltip (concat "Copy " @label)}}>
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
</template>;

export default PropertyListItemValue;
