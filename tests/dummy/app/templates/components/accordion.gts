import Snippet from '../../components/snippet';
import { Accordion, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Accordion"}}
  {{breadcrumb "Accordion" route="components.accordion"}}

  <Heading
    @title="Accordion"
    @subtitle="Build vertically collapsing accordions in combination with our Collapse JavaScript plugin."
  />

  <Snippet @name="accordion.gts">
    {{! BEGIN-SNIPPET accordion }}
    <Accordion as |accordion|>
      <accordion.item as |item|>
        <item.button>Accordion Item #1</item.button>
        <item.body>Accordion Body</item.body>
      </accordion.item>
      <accordion.item as |item|>
        <item.button>Accordion Item #2</item.button>
        <item.body>Accordion Body</item.body>
      </accordion.item>
      <accordion.item as |item|>
        <item.button>Accordion Item #3</item.button>
        <item.body>Accordion Body</item.body>
      </accordion.item>
    </Accordion>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="accordion1.gts">
    {{! BEGIN-SNIPPET accordion1 }}
    <Accordion @isAlwaysOpen={{true}} as |accordion|>
      <accordion.item as |item|>
        <item.button>Accordion Item #1</item.button>
        <item.body>Accordion Body</item.body>
      </accordion.item>
      <accordion.item as |item|>
        <item.button>Accordion Item #2</item.button>
        <item.body>Accordion Body</item.body>
      </accordion.item>
      <accordion.item as |item|>
        <item.button>Accordion Item #3</item.button>
        <item.body>Accordion Body</item.body>
      </accordion.item>
    </Accordion>
    {{! END-SNIPPET }}
  </Snippet>
</template>
