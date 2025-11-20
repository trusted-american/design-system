import type { TOC } from '@ember/component/template-only';
import PropertyListItemKey from './item/key';
import PropertyListItemValue from './item/value';

export interface PropertyListItemSignature {
  Args: {
    value: string | number | boolean | null | undefined;
    label: string;
    noLabel: string;
    copyLabel: string;
    copiedLabel: string;
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
        @noLabel={{@noLabel}}
        @copyLabel={{@copyLabel}}
        @copiedLabel={{@copiedLabel}}
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
      @noLabel={{@noLabel}}
      @copyLabel={{@copyLabel}}
      @copiedLabel={{@copiedLabel}}
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
