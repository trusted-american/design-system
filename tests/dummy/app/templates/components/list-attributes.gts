import { array, fn, hash } from '@ember/helper';
import Component from '@glimmer/component';
import type { ListAttributesKey } from '@trusted-american/design-system/components/list-attributes';
import { Heading, ListAttributes } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface T {
  a: string;
  b: string;
  c: string;
}

interface ComponentsListAttributesSignature {
  Args: {};
}

export default class ComponentsListAttributes extends Component<ComponentsListAttributesSignature> {
  selected: ListAttributesKey<T>[] = ['a'];
}

<template>
  {{pageTitle "List attributes"}}
  {{breadcrumb "List attributes" route="components.list-attributes"}}

  <Heading @title="List attributes" />

  <p>
    Value:
    {{#each this.selected as |item|}}
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
      @selected={{this.selected}}
      @label="Edit columns"
      @onChange={{fn (mut this.selected)}}
    />
    {{! END-SNIPPET }}
  </Snippet>
  </template>
}
