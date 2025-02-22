import PropertyListItemKey from './item/key';
import PropertyListItemValue from './item/value';

import type { TOC } from '@ember/component/template-only';

export interface PropertyListItemSignature {
  Args: {
    value: string | number | boolean | null | undefined;
    label: string;
    help?: string;
    isStatic?: boolean;
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [];
    trailing: [];
  };
  Element: HTMLElement;
}

const PropertyListItem: TOC<PropertyListItemSignature> = <template>
  {{#if @isHorizontal}}
    <div class="col-auto border-end">
      <PropertyListItemKey @label={{@label}} @help={{@help}} />
      <PropertyListItemValue
        @value={{@value}}
        @label={{@label}}
        @isStatic={{@isStatic}}
        ...attributes
      >
        <:default>
          {{#if (has-block)}}
            {{yield}}
          {{else}}
            {{@value}}
          {{/if}}
        </:default>
        <:trailing>{{yield to="trailing"}}</:trailing>
      </PropertyListItemValue>
    </div>
  {{else}}
    <PropertyListItemKey @label={{@label}} @help={{@help}} class="col-5" />
    <PropertyListItemValue
      @value={{@value}}
      @label={{@label}}
      @isStatic={{@isStatic}}
      class="col-7 overflow-hidden"
      ...attributes
    >
      <:default>
        {{#if (has-block)}}
          {{yield}}
        {{else}}
          {{@value}}
        {{/if}}
      </:default>
      <:trailing>{{yield to="trailing"}}</:trailing>
    </PropertyListItemValue>
  {{/if}}
</template>;

export default PropertyListItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item': typeof PropertyListItem;
  }
}
