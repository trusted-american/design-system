import { Card, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Card"}}
  {{breadcrumb "Card" route="components.card"}}

  <Heading @title="Card" />

  <Snippet @name="card.gts">
    {{! BEGIN-SNIPPET card }}
    <Card as |card|>
      <card.header>
        Header
      </card.header>
      <card.body>
        Body
      </card.body>
      <card.footer>
        Footer
      </card.footer>
    </Card>
    {{! END-SNIPPET }}
  </Snippet>
</template>
