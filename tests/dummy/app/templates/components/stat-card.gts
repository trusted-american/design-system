import { faUser } from '@fortawesome/free-solid-svg-icons';
import { Heading, StatCard } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Stat card"}}
  {{breadcrumb "Stat card" route="components.stat-card"}}

  <Heading @title="Stat card" />

  <Snippet @name="stat-card.gts">
    {{! BEGIN-SNIPPET stat-card }}
    <div class="columns-5">
      <StatCard @label="Key 1" @value="0" />
      <StatCard @label="Key 2" @value="12" />
      <StatCard @label="Key 3" @value="123" />
      <StatCard @label="Key 4" @value="1,234" @icon={{faUser}} @route="index" />
      <StatCard @label="Key 5" @icon={{faUser}} @route="index">
        Block
      </StatCard>
    </div>
    {{! END-SNIPPET }}
  </Snippet>
</template>
