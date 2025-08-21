import { faCheck } from '@fortawesome/free-solid-svg-icons';
import { Button, Icon, MainBody } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Home"}}
  {{breadcrumb "Home" route="index"}}

  <MainBody>
    <div class="p-12 mb-6 bg-gray-100 rounded-lg">
      <div class="py-5">
        <h1 class="text-4xl font-bold mb-4">Design System</h1>
        <p class="text-xl mb-4">Components for building robust user interfaces.</p>
        <Button
          @label="Get started"
          @color="primary"
          @size="lg"
          @route="guides.introduction"
        />
      </div>
    </div>

    <div class="columns-3 g-4 py-5">
      <div class="col flex items-start">
        <div
          class="p-2 rounded text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
        >
          <Icon @icon={{faCheck}} />
        </div>
        <div>
          <h3 class="text-3xl font-bold mb-3">Flexible</h3>
          <p class="mb-4">Paragraph of text beneath the heading to explain the
            heading. We'll add onto it with another sentence and probably just
            keep going until we run out of words.</p>
          <Button @label="Explore" @color="primary" @route="components" />
        </div>
      </div>
      <div class="col flex items-start">
        <div
          class="p-2 rounded text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
        >
          <Icon @icon={{faCheck}} />
        </div>
        <div>
          <h3 class="text-3xl font-bold mb-3">Lightweight</h3>
          <p class="mb-4">Paragraph of text beneath the heading to explain the
            heading. We'll add onto it with another sentence and probably just
            keep going until we run out of words.</p>
          <Button @label="Explore" @color="primary" @route="components" />
        </div>
      </div>
      <div class="col flex items-start">
        <div
          class="p-2 rounded text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
        >
          <Icon @icon={{faCheck}} />
        </div>
        <div>
          <h3 class="text-3xl font-bold mb-3">Effortless</h3>
          <p class="mb-4">Paragraph of text beneath the heading to explain the
            heading. We'll add onto it with another sentence and probably just
            keep going until we run out of words.</p>
          <Button @label="Explore" @color="primary" @route="components" />
        </div>
      </div>
    </div>
  </MainBody>
</template>
