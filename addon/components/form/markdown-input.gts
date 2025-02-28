import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Button from '../button';
import Card from '../card';
import Icon from '../icon';
import Nav from '../nav';
import NavItem from '../nav/item';
import FormLabel from './label';
import FormTextarea from './textarea';
import FormHelp from './help';
import tooltip from '../../modifiers/tooltip';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import { eq } from 'ember-truth-helpers';

import type { BaseArgs } from './input';

import '@github/markdown-toolbar-element';

interface Args extends BaseArgs {
  value: string | null;
  onChange: (value: string) => void;
}

export interface FormMarkdownInputSignature {
  Args: Args;
  Element: HTMLTextAreaElement;
}

export default class FormMarkdownInput extends Component<FormMarkdownInputSignature> {
  @tracked isPreview = false;

  <template>
    {{#unless @isInputOnly}}
      <FormLabel
        @label={{@label}}
        @identifier={{@identifier}}
        @isRequired={{@isRequired}}
        @requiredLabel={{@requiredLabel}}
      />
    {{/unless}}

    <Card as |card|>
      <card.header class="d-flex justify-content-between align-items-center">
        <Nav class="card-header-tabs">
          <NavItem
            {{! TODO: string }}
            @label="Write"
            class={{if (eq false this.isPreview) "active"}}
            data-test-write
            {{on "click" (fn (mut this.isPreview) false)}}
          />
          <NavItem
            @label="Preview"
            class={{if (eq true this.isPreview) "active"}}
            data-test-preview
            {{on "click" (fn (mut this.isPreview) true)}}
          />
        </Nav>

        {{#unless this.isPreview}}
          <markdown-toolbar for={{@identifier}}>
            <md-header>
              <Button
                @label="Heading"
                @icon="heading"
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip "Heading" placement="bottom"}}
              />
            </md-header>
            <md-bold>
              <Button
                @label="Bold"
                @icon="bold"
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip "Bold" placement="bottom"}}
              />
            </md-bold>
            <md-italic>
              <Button
                @label="Italic"
                @icon="italic"
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip "Italic" placement="bottom"}}
              />
            </md-italic>
            <md-code>
              <Button
                @label="Code"
                @icon="code"
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip "Code" placement="bottom"}}
              />
            </md-code>
            <md-link>
              <Button
                @label="Link"
                @icon="link"
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip "Link" placement="bottom"}}
              />
            </md-link>
            <md-ordered-list>
              <Button
                @label="Numbered list"
                @icon="list-ol"
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip "Numbered list" placement="bottom"}}
              />
            </md-ordered-list>
            <md-unordered-list>
              <Button
                @label="Unordered list"
                @icon="list-ul"
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip "Unordered list" placement="bottom"}}
              />
            </md-unordered-list>
          </markdown-toolbar>
        {{/unless}}
      </card.header>
      <card.body class="p-2">
        {{#if this.isPreview}}
          <div class="markdown-input-preview border">
            {{#if @value}}
              <MarkdownToHtml @markdown={{@value}} />
            {{else}}
              Nothing to preview
            {{/if}}
          </div>
        {{else}}
          <FormTextarea
            @value={{@value}}
            @label={{@label}}
            @identifier={{@identifier}}
            @isRequired={{@isRequired}}
            @invalidFeedback={{@invalidFeedback}}
            @requiredLabel={{@requiredLabel}}
            @isInputOnly={{true}}
            @onChange={{@onChange}}
            rows="4"
            ...attributes
          />
          <p class="small text-secondary mt-2 mb-0">
            <Icon @icon="markdown" @prefix="fab" />
            Markdown is supported
          </p>
        {{/if}}
      </card.body>
    </Card>

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::MarkdownInput': typeof FormMarkdownInput;
  }
}
