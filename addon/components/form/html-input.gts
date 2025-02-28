import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import Card from '../card';
import Nav from '../nav';
import NavItem from '../nav/item';
import FormLabel from './label';
import FormTextarea from './textarea';
import FormFeedback from './feedback';
import FormHelp from './help';
import { on } from '@ember/modifier';
import PellEditor from 'ember-pell/components/pell-editor';
import { eq } from 'ember-truth-helpers';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  value: string | null;
  editorLabel: string;
  codeLabel: string;
  onChange: (value: string) => void;
}

export interface FormHtmlInputSignature {
  Args: Args;
  Element: HTMLElement;
}

export default class FormHtmlInput extends Component<FormHtmlInputSignature> {
  @tracked isCode = false;

  // TODO: debt https://github.com/PoslinskiNet/ember-pell/pull/130
  get value(): string | null {
    if (!this.args.value) {
      const element = document.querySelector('.pell-content');
      if (element) {
        element.innerHTML = '';
      }
    }
    return this.args.value;
  }

  @action
  setEditor(event: Event) {
    event.preventDefault();
    this.isCode = false;
  }

  @action
  setCode(event: Event) {
    event.preventDefault();
    this.isCode = true;
  }

  <template>
    {{#unless @isInputOnly}}
      <FormLabel
        @label={{@label}}
        @identifier={{@identifier}}
        @isRequired={{@isRequired}}
      />
    {{/unless}}

    <Card as |card|>
      <card.header>
        <Nav class="card-header-tabs">
          <NavItem
            @label={{@editorLabel}}
            class={{if (eq false this.isCode) "active"}}
            data-test-editor
            {{on "click" this.setEditor}}
          />
          <NavItem
            @label={{@codeLabel}}
            class={{if (eq true this.isCode) "active"}}
            data-test-code
            {{on "click" this.setCode}}
          />
        </Nav>
      </card.header>
      <card.body class="p-0">
        {{#if this.isCode}}
          <FormTextarea
            @value={{@value}}
            @label={{@label}}
            @identifier={{@identifier}}
            @isRequired={{@isRequired}}
            @isInputOnly={{true}}
            @onChange={{@onChange}}
            class="border-0"
            ...attributes
          />
        {{else}}
          <PellEditor
            @value={{this.value}}
            @onChange={{@onChange}}
            data-test-value-editor
            ...attributes
          />
        {{/if}}
      </card.body>
    </Card>

    {{! hidden input for validation }}
    <input
      value="{{this.value}}"
      type="text"
      required={{@isRequired}}
      class="d-none"
      aria-label={{@label}}
    />

    {{#if @invalidFeedback}}
      <FormFeedback @label={{@invalidFeedback}} />
    {{/if}}

    {{#each @errors as |error|}}
      <FormFeedback @label={{error.message}} />
    {{/each}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::HtmlInput': typeof FormHtmlInput;
  }
}
