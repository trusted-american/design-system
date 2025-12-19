import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { FormHtmlInput, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormHtmlInputRoute from '../../../routes/components/form/html-input';

interface ComponentsFormHtmlInputSignature {
  Args: {
    model: ModelFrom<ComponentsFormHtmlInputRoute>;
  };
}

export default class ComponentsFormHtmlInput extends Component<ComponentsFormHtmlInputSignature> {
  @tracked value: string | null = '<p>Hello World!</p>';

  <template>
    {{pageTitle "HTML input"}}
    {{breadcrumb "HTML input" route="components.form.html-input"}}

    <Subheading @title="HTML input" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-html-input.gts">
      {{! BEGIN-SNIPPET form-html-input }}
      <FormHtmlInput
        @value={{this.value}}
        @label="Label"
        @id="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @editorLabel="Editor"
        @codeLabel="Code"
        @boldButtonLabel="Bold"
        @italicButtonLabel="Italic"
        @strikeButtonLabel="Strike"
        @headingButtonLabel="Heading"
        @paragraphButtonLabel="Paragraph"
        @quoteButtonLabel="Quote"
        @numberedListButtonLabel="Numbered list"
        @unorderedListButtonLabel="Unordered list"
        @codeButtonLabel="Code"
        @onChange={{fn (mut this.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
