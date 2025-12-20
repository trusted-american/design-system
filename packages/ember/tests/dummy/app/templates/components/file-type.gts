import { FileType, Heading, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "File type"}}
  {{breadcrumb "File type" route="components.file-type"}}

  <Heading @title="File type" />

  <Subheading @title="Examples" />

  <Snippet @name="file-type.gts">
    {{! BEGIN-SNIPPET file-type }}
    <FileType @name="test.png" />
    <FileType @name="test.mp3" />
    <FileType @name="test.pdf" />
    <FileType @name="test.csv" />
    <FileType @name="test.zip" />
    <FileType @name="test.doc" />
    <FileType @name="test.xls" />
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Sizes" />

  <Snippet @name="file-type2.gts">
    {{! BEGIN-SNIPPET file-type2 }}
    <FileType @name="test.pdf" @size="2xs" />
    <FileType @name="test.pdf" @size="xs" />
    <FileType @name="test.pdf" @size="sm" />
    <FileType @name="test.pdf" />
    <FileType @name="test.pdf" @size="lg" />
    <FileType @name="test.pdf" @size="xl" />
    <FileType @name="test.pdf" @size="2xl" />
    {{! END-SNIPPET }}
  </Snippet>
</template>
