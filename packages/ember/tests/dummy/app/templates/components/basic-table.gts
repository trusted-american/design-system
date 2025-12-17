import { BasicTable, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Basic table"}}
  {{breadcrumb "Basic table" route="components.basic-table"}}

  <Heading @title="Basic table" />

  <Snippet @name="basic-table.gts">
    {{! BEGIN-SNIPPET basic-table }}
    <BasicTable>
      <thead>
        <tr>
          <th scope="col">
            Test
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            Test
          </td>
        </tr>
      </tbody>
    </BasicTable>
    {{! END-SNIPPET }}
  </Snippet>
</template>
