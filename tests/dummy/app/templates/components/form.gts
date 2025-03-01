import RouteTemplate from 'ember-route-template';
import { Heading, Nav, NavItem } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Form"}}
    {{breadcrumb "Form" route="components.form"}}

    <Heading
      @title="Form"
      @subtitle="Examples and usage guidelines for form control styles, layout options, and custom components for creating a wide variety of forms."
    />

    <div class="row g-4">
      <div class="col-12 col-md-3">
        <Nav @isPills={{true}} @isVertical={{true}}>
          <NavItem @route="components.form.check" @label="Form check" />
          <NavItem
            @route="components.form.date-input"
            @label="Form date input"
          />
          <NavItem
            @route="components.form.file-dropzone"
            @label="Form file dropzone"
          />
          <NavItem
            @route="components.form.file-input"
            @label="Form file input"
          />
          <NavItem
            @route="components.form.html-input"
            @label="Form HTML input"
          />
          <NavItem @route="components.form.input" @label="Form input" />
          <NavItem
            @route="components.form.markdown-input"
            @label="Form Markdown input"
          />
          <NavItem
            @route="components.form.number-input"
            @label="Form number input"
          />
          <NavItem
            @route="components.form.phone-input"
            @label="Form phone input"
          />
          <NavItem
            @route="components.form.power-select"
            @label="Form power select"
          />
          <NavItem
            @route="components.form.power-select-multiple"
            @label="Form power select multiple"
          />
          <NavItem @route="components.form.radio" @label="Form radio" />
          <NavItem
            @route="components.form.radio-button"
            @label="Form radio button"
          />
          <NavItem
            @route="components.form.radio-card"
            @label="Form radio card"
          />
          <NavItem @route="components.form.select" @label="Form select" />
          <NavItem @route="components.form.textarea" @label="Form textarea" />
          <NavItem
            @route="components.form.time-input"
            @label="Form time input"
          />
        </Nav>
      </div>
      <div class="col-12 col-md-9">
        {{outlet}}
      </div>
    </div>
  </template>,
) as TemplateFactory;
