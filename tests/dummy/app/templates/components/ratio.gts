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
    <Ratio
      @ratio="21x9"
      class="w-1/2 flex justify-center items-center bg-gray-100"
    >
      21x9
    </Ratio>
    {{! END-SNIPPET }}
  </Snippet>
</template>
