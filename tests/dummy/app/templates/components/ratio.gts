import { Heading, Ratio } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Ratio"}}
  {{breadcrumb "Ratio" route="components.ratio"}}

  <Heading @title="Ratio" />

  <Snippet @name="ratio.gts">
    {{! BEGIN-SNIPPET ratio }}
    <Ratio @ratio="21x9" class="w-50">
      <div
        class="d-flex justify-content-center align-items-center text-bg-secondary"
      >21x9</div>
    </Ratio>
    {{! END-SNIPPET }}
  </Snippet>
</template>
