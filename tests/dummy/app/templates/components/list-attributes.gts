import type { TOC } from '@ember/component/template-only';
import { array, fn, hash } from '@ember/helper';
import { Heading, ListAttributes } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsListAttributesController from '../../controllers/components/list-attributes';

interface ComponentsListAttributesSignature {
  Args: {
    controller: ComponentsListAttributesController;
  };
}

<template>
  {{pageTitle "List attributes"}}
  {{breadcrumb "List attributes" route="components.list-attributes"}}

  <Heading @title="List attributes" />

  <p>
    Value:
    {{#each @controller.selected as |item|}}
      {{item}}
    {{/each}}
  </p>

  <Snippet @name="list-attributes.gts">
    {{! BEGIN-SNIPPET list-attributes }}
    <ListAttributes
      @presets={{array (hash values=(array "a") label="Default")}}
      @options={{array
        (hash value="a" label="A")
        (hash value="b" label="B")
        (hash value="c" label="C")
      }}
      @selected={{@controller.selected}}
      @label="Edit columns"
      @onChange={{fn (mut @controller.selected)}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsListAttributesSignature>;
