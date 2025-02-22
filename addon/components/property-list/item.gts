import Component from '@glimmer/component';
import PropertyListItemKey from './item/key';
import PropertyListItemValue from './item/value';

export interface PropertyListItemSignature {
  Args: {
    value: unknown; // string | number | boolean | Date | null | undefined
    label: string;
    help?: string;
    isStatic?: boolean;
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [];
    side: [];
  };
  Element: HTMLElement;
}

export default class PropertyListItem extends Component<PropertyListItemSignature> {
  <template>
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
              {{! @glint-expect-error }}
              {{@value}}
            {{/if}}
          </:default>
          <:side>{{yield to="side"}}</:side>
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
            {{! @glint-expect-error }}
            {{@value}}
          {{/if}}
        </:default>
        <:side>{{yield to="side"}}</:side>
      </PropertyListItemValue>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item': typeof PropertyListItem;
  }
}
