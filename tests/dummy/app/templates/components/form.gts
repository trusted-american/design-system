import RouteTemplate from 'ember-route-template';
import { Heading, Nav, NavItem } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

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
          <NavItem @route="components.form.check" @label="Check" />
          <NavItem @route="components.form.date-input" @label="Date input" />
          <NavItem
            @route="components.form.file-dropzone"
            @label="File dropzone"
          />
          <NavItem @route="components.form.file-input" @label="File input" />
          <NavItem @route="components.form.html-input" @label="HTML input" />
          <NavItem @route="components.form.input" @label="Input" />
          <NavItem
            @route="components.form.markdown-input"
            @label="Markdown input"
          />
          <NavItem
            @route="components.form.number-input"
            @label="Number input"
          />
          <NavItem @route="components.form.phone-input" @label="Phone input" />
          <NavItem
            @route="components.form.power-select"
            @label="Power select"
          />
          <NavItem
            @route="components.form.power-select-multiple"
            @label="Power select multiple"
          />
          <NavItem @route="components.form.radio" @label="Radio" />
          <NavItem
            @route="components.form.radio-button"
            @label="Radio button"
          />
          <NavItem @route="components.form.radio-card" @label="Radio card" />
          <NavItem @route="components.form.select" @label="Select" />
          <NavItem @route="components.form.textarea" @label="Textarea" />
          <NavItem @route="components.form.time-input" @label="Time input" />
        </Nav>
      </div>
      <div class="col-12 col-md-9">
        {{outlet}}
      </div>
    </div>
  </template>,
);
