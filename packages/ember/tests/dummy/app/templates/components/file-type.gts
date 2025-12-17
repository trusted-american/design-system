import { FileType, Heading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "File type"}}
  {{breadcrumb "File type" route="components.file-type"}}

  <Heading @title="File type" />

  <Snippet @name="file-type.gts">
    {{! BEGIN-SNIPPET file-type }}
    <FileType @name="test.pdf" />
    <FileType @name="test.pdf" @size="lg" />
    {{! END-SNIPPET }}
  </Snippet>
</template>
