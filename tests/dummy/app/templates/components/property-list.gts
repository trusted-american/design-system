import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import {
  Heading,
  PropertyList,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Property list"}}
    {{breadcrumb "Property list" route="components.property-list"}}

    <Heading @title="Property list" />

    <Subheading @title="Default" />

    <Snippet @name="property-list.gts">
      {{! BEGIN-SNIPPET property-list }}
      <PropertyList @noLabel="No" as |list|>
        <list.item @value="Value 1" @label="Key 1" @help="This is a tooltip." />
        <list.item @value="Value 2" @label="Key 2">
          Value 2
        </list.item>
        <list.item @value="Value 3" @label="Key 3">
          <:default>
            Value 3
          </:default>
          <:trailing>
            Trailing
          </:trailing>
        </list.item>
        <list.item @value={{null}} @label="Key 4" />
        <list.item @value={{true}} @label="Key 5" />
        <list.item @value={{false}} @label="Key 6" />
      </PropertyList>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Horizontal" />

    <Snippet @name="property-list1.gts">
      {{! BEGIN-SNIPPET property-list1 }}
      <PropertyList @noLabel="No" @isHorizontal={{true}} as |list|>
        <list.item @value="Value 1" @label="Key 1" @help="This is a tooltip." />
        <list.item @value="Value 2" @label="Key 2">
          Value 2
        </list.item>
        <list.item @value="Value 3" @label="Key 3">
          Value 3
        </list.item>
        <list.item @value={{null}} @label="Key 4" />
      </PropertyList>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
