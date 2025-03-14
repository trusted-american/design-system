import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { hash } from '@ember/helper';
import { on } from '@ember/modifier';
import { Button, Heading, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsButtonController from '../../controllers/components/button';

export default RouteTemplate<{
  Args: {
    controller: ComponentsButtonController;
  };
}>(
  <template>
    {{pageTitle "Button"}}
    {{breadcrumb "Button" route="components.button"}}

    <Heading @title="Button" />

    <Snippet @name="button.gts">
      {{! BEGIN-SNIPPET button }}
      <Button @label="Default button" {{on "click" @controller.click}} />
      <Button
        @label="Success button"
        @color="success"
        {{on "click" @controller.click}}
      />
      <Button
        @label="Success button with icon"
        @color="success"
        @icon="plus"
        {{on "click" @controller.click}}
      />
      <Button
        @label="Success button with trailing icon"
        @color="success"
        @icon="plus"
        @isIconTrailing={{true}}
        {{on "click" @controller.click}}
      />
      <Button
        @label="Success button with only icon"
        @icon="plus"
        @isIconOnly={{true}}
        @color="success"
        {{on "click" @controller.click}}
      />
      <Button
        @label="Loading button"
        @isLoading={{true}}
        {{on "click" @controller.click}}
      />
      <Button
        @label="Disabled button"
        disabled
        {{on "click" @controller.click}}
      />
      <Button
        @label="Count button"
        @count={{3}}
        {{on "click" @controller.click}}
      />
      <Button
        @label="Default button"
        @shortcut="n"
        {{on "click" @controller.click}}
      />
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Route" />

    <Snippet @name="button1.gts">
      {{! BEGIN-SNIPPET button1 }}
      <Button @label="Route button" @route="index" />
      <Button
        @label="Route button with query"
        @route="index"
        @query={{(hash)}}
      />
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Link" />

    <Snippet @name="button2.gts">
      {{! BEGIN-SNIPPET button2 }}
      <Button
        @label="Link button"
        @icon="up-right-from-square"
        @href="https://www.google.com/"
      />

      <Button
        @label="Link button with trailing icon"
        @icon="arrow-right"
        @isIconTrailing={{true}}
        @href="https://www.google.com/"
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
