import RouteTemplate from 'ember-route-template';
import { Heading, Nav, NavItem } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Form"}}
    {{breadcrumb "Form" route="comps.form"}}

    <Heading
      @title="Form"
      @subtitle="Examples and usage guidelines for form control styles, layout options, and custom components for creating a wide variety of forms."
    />

    <div class="row g-4">
      <div class="col-12 col-md-3">
        <Nav @isPills={{true}} @isVertical={{true}}>
          <NavItem @route="comps.form.check" @label="Form check" />
          <NavItem @route="comps.form.date-input" @label="Form date input" />
          <NavItem
            @route="comps.form.file-dropzone"
            @label="Form file dropzone"
          />
          <NavItem @route="comps.form.file-input" @label="Form file input" />
          <NavItem @route="comps.form.html-input" @label="Form HTML input" />
          <NavItem @route="comps.form.input" @label="Form input" />
          <NavItem
            @route="comps.form.markdown-input"
            @label="Form Markdown input"
          />
          <NavItem
            @route="comps.form.number-input"
            @label="Form number input"
          />
          <NavItem @route="comps.form.phone-input" @label="Form phone input" />
          <NavItem
            @route="comps.form.power-select"
            @label="Form power select"
          />
          <NavItem
            @route="comps.form.power-select-multiple"
            @label="Form power select multiple"
          />
          <NavItem @route="comps.form.radio" @label="Form radio" />
          <NavItem
            @route="comps.form.radio-button"
            @label="Form radio button"
          />
          <NavItem @route="comps.form.radio-card" @label="Form radio card" />
          <NavItem @route="comps.form.select" @label="Form select" />
          <NavItem @route="comps.form.textarea" @label="Form textarea" />
          <NavItem @route="comps.form.time-input" @label="Form time input" />
        </Nav>
      </div>
      <div class="col-12 col-md-9">
        {{outlet}}
      </div>
    </div>
  </template>,
) as TemplateFactory;
