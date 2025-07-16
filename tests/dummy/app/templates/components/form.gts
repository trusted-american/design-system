import { Heading, Nav } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Form"}}
  {{breadcrumb "Form" route="components.form"}}

  <Heading
    @title="Form"
    @subtitle="Examples and usage guidelines for form control styles, layout options, and custom components for creating a wide variety of forms."
  />

  <div class="row g-4">
    <div class="col-12 col-md-3">
      <Nav @isPills={{true}} @isVertical={{true}} as |nav|>
        <nav.item @route="components.form.check" @label="Check" />
        <nav.item @route="components.form.date-input" @label="Date input" />
        <nav.item
          @route="components.form.file-dropzone"
          @label="File dropzone"
        />
        <nav.item @route="components.form.file-input" @label="File input" />
        <nav.item @route="components.form.html-input" @label="HTML input" />
        <nav.item @route="components.form.input" @label="Input" />
        <nav.item
          @route="components.form.markdown-input"
          @label="Markdown input"
        />
        <nav.item @route="components.form.number-input" @label="Number input" />
        <nav.item @route="components.form.phone-input" @label="Phone input" />
        <nav.item @route="components.form.power-select" @label="Power select" />
        <nav.item
          @route="components.form.power-select-multiple"
          @label="Power select multiple"
        />
        <nav.item @route="components.form.radio" @label="Radio" />
        <nav.item @route="components.form.radio-button" @label="Radio button" />
        <nav.item @route="components.form.radio-card" @label="Radio card" />
        <nav.item @route="components.form.select" @label="Select" />
        <nav.item @route="components.form.textarea" @label="Textarea" />
        <nav.item @route="components.form.time-input" @label="Time input" />
      </Nav>
    </div>
    <div class="col-12 col-md-9">
      {{outlet}}
    </div>
  </div>
</template>
