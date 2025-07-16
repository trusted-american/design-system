import Snippet from '../../components/snippet';
import { Avatar, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Avatar"}}
  {{breadcrumb "Avatar" route="components.avatar"}}

  <Heading @title="Avatar" />

  <Snippet @name="avatar.gts">
    {{! BEGIN-SNIPPET avatar }}
    <Avatar @id="62f76a6f5a1162f76a6f5a11" @alt="Avatar" />
    <Avatar
      @id="62f76a6f5a1162f76a6f5a12"
      @url="https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg"
      @alt="Avatar"
    />
    {{! END-SNIPPET }}
  </Snippet>
</template>
