import { Button, MainBody } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Home"}}
  {{breadcrumb "Home" route="index"}}

  <MainBody>
    <div class="p-12 mb-6 bg-gray-100 rounded-lg">
      <div class="py-5">
        <h1 class="text-4xl mb-4">Design System</h1>
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
          class="icon-square text-bg-light inline-flex items-center justify-center fs-4 flex-shrink-0 me-3"
        >
          <svg class="bi" width="1em" height="1em"><use
              xlink:href="#toggles2"
            ></use></svg>
        </div>
        <div>
          <h3 class="text-3xl mb-3">Flexible</h3>
          <p class="mb-4">Paragraph of text beneath the heading to explain the
            heading. We'll add onto it with another sentence and probably just
            keep going until we run out of words.</p>
          <Button @label="Explore" @color="primary" @route="components" />
        </div>
      </div>
      <div class="col flex items-start">
        <div
          class="icon-square text-bg-light inline-flex items-center justify-center fs-4 flex-shrink-0 me-3"
        >
          <svg class="bi" width="1em" height="1em"><use
              xlink:href="#cpu-fill"
            ></use></svg>
        </div>
        <div>
          <h3 class="text-3xl mb-3">Lightweight</h3>
          <p class="mb-4">Paragraph of text beneath the heading to explain the
            heading. We'll add onto it with another sentence and probably just
            keep going until we run out of words.</p>
          <Button @label="Explore" @color="primary" @route="components" />
        </div>
      </div>
      <div class="col flex items-start">
        <div
          class="icon-square text-bg-light inline-flex items-center justify-center fs-4 flex-shrink-0 me-3"
        >
          <svg class="bi" width="1em" height="1em"><use
              xlink:href="#tools"
            ></use></svg>
        </div>
        <div>
          <h3 class="text-3xl mb-3">Effortless</h3>
          <p class="mb-4">Paragraph of text beneath the heading to explain the
            heading. We'll add onto it with another sentence and probably just
            keep going until we run out of words.</p>
          <Button @label="Explore" @color="primary" @route="components" />
        </div>
      </div>
    </div>
  </MainBody>
</template>
