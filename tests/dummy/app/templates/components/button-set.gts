import type { TOC } from '@ember/component/template-only';
import Snippet from '../../components/snippet';
import { on } from '@ember/modifier';
import { ButtonSet, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsButtonSetController from '../../controllers/components/button-set';

interface ComponentsButtonSetSignature {
  Args: {
    controller: ComponentsButtonSetController;
  };
}

<template>
  {{pageTitle "Button set"}}
  {{breadcrumb "Button set" route="components.button-set"}}

  <Heading @title="Button set" />

  <Snippet @name="button-set.gts">
    {{! BEGIN-SNIPPET button-set }}
    <ButtonSet as |buttonSet|>
      <buttonSet.button @label="Button 1" {{on "click" @controller.click}} />
      <buttonSet.button @label="Button 2" {{on "click" @controller.click}} />
    </ButtonSet>
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsButtonSetSignature>;
