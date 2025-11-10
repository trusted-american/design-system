import Component from '@glimmer/component';
import { hash } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  faArrowRight,
  faPlus,
  faUpRightFromSquare,
} from '@fortawesome/free-solid-svg-icons';
import { Button, Heading, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsButtonRoute from '../../routes/components/button';

interface ComponentsButtonSignature {
  Args: {
    model: ModelFrom<ComponentsButtonRoute>;
  };
}

export default class ComponentsButton extends Component<ComponentsButtonSignature> {
  click = () => {
    alert('Action');
  };

  <template>
    {{pageTitle "Button"}}
    {{breadcrumb "Button" route="components.button"}}

    <Heading @title="Button" />

    <Snippet @name="button.gts">
      {{! BEGIN-SNIPPET button }}
      <Button @label="Default button" {{on "click" this.click}} />
      <Button
        @label="Success button"
        @color="success"
        {{on "click" this.click}}
      />
      <Button
        @label="Success button with icon"
        @color="success"
        @icon={{faPlus}}
        {{on "click" this.click}}
      />
      <Button
        @label="Success button with trailing icon"
        @color="success"
        @icon={{faPlus}}
        @isIconTrailing={{true}}
        {{on "click" this.click}}
      />
      <Button
        @label="Success button with only icon"
        @icon={{faPlus}}
        @isIconOnly={{true}}
        @color="success"
        {{on "click" this.click}}
      />
      <Button
        @label="Loading button"
        @isLoading={{true}}
        {{on "click" this.click}}
      />
      <Button @label="Disabled button" disabled {{on "click" this.click}} />
      <Button @label="Count button" @count={{3}} {{on "click" this.click}} />
      <Button @label="Default button" @shortcut="n" {{on "click" this.click}} />
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
        @icon={{faUpRightFromSquare}}
        @href="https://www.google.com/"
      />

      <Button
        @label="Link button with trailing icon"
        @icon={{faArrowRight}}
        @isIconTrailing={{true}}
        @href="https://www.google.com/"
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
