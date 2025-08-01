import type { TOC } from '@ember/component/template-only';
import { faBook } from '@fortawesome/free-solid-svg-icons';
import { Heading, Placeholder } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsPlaceholderController from '../../controllers/components/placeholder';

interface ComponentsPlaceholderSignature {
  Args: {
    controller: ComponentsPlaceholderController;
  };
}

<template>
  {{pageTitle "Placeholder"}}
  {{breadcrumb "Placeholder" route="components.placeholder"}}

  <Heading @title="Placeholder" />

  <Snippet @name="placeholder.gts">
    {{! BEGIN-SNIPPET placeholder }}
    <Placeholder
      @icon={{faBook}}
      @title="Placeholder heading"
      @subtitle="Use it to provide information when no dynamic content exists."
      @buttonLabel="Create the first page"
      @secondaryButtonLabel="Learn more about wikis"
      @onClick={{@controller.click}}
      @onSecondaryClick={{@controller.click}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsPlaceholderSignature>;
