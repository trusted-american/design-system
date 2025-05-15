import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Button from '../button';
import Card from '../card';
import Icon from '../icon';
import Nav from '../nav';
import FormLabel from './label';
import FormTextarea from './textarea';
import FormHelp from './help';
import tooltip from '../../modifiers/tooltip';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import { eq } from 'ember-truth-helpers';
import type { FormInputArgs } from './input';
import '@github/markdown-toolbar-element';
import {
  faBold,
  faCode,
  faHeading,
  faItalic,
  faLink,
  faListOl,
  faListUl,
} from '@fortawesome/free-solid-svg-icons';
import { faMarkdown } from '@fortawesome/free-brands-svg-icons';

interface Args extends FormInputArgs {
  value: string | null;
  writeLabel: string;
  previewLabel: string;
  headingLabel: string;
  boldLabel: string;
  italicLabel: string;
  codeLabel: string;
  linkLabel: string;
  numberedListLabel: string;
  unorderedListLabel: string;
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
        <Nav @isStatic={{true}} class="card-header-tabs" as |nav|>
          <nav.item
            @label={{@writeLabel}}
            class={{if (eq false this.isPreview) "active"}}
            data-test-write
            {{on "click" (fn (mut this.isPreview) false)}}
          />
          <nav.item
            @label={{@previewLabel}}
            class={{if (eq true this.isPreview) "active"}}
            data-test-preview
            {{on "click" (fn (mut this.isPreview) true)}}
          />
        </Nav>

        {{#unless this.isPreview}}
          <markdown-toolbar for={{@identifier}}>
            <md-header>
              <Button
                @label={{@headingLabel}}
                @icon={{faHeading}}
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip @headingLabel placement="bottom"}}
              />
            </md-header>
            <md-bold>
              <Button
                @label={{@boldLabel}}
                @icon={{faBold}}
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip @boldLabel placement="bottom"}}
              />
            </md-bold>
            <md-italic>
              <Button
                @label={{@italicLabel}}
                @icon={{faItalic}}
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip @italicLabel placement="bottom"}}
              />
            </md-italic>
            <md-code>
              <Button
                @label={{@codeLabel}}
                @icon={{faCode}}
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip @codeLabel placement="bottom"}}
              />
            </md-code>
            <md-link>
              <Button
                @label={{@linkLabel}}
                @icon={{faLink}}
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip @linkLabel placement="bottom"}}
              />
            </md-link>
            <md-ordered-list>
              <Button
                @label={{@numberedListLabel}}
                @icon={{faListOl}}
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip @numberedListLabel placement="bottom"}}
              />
            </md-ordered-list>
            <md-unordered-list>
              <Button
                @label={{@unorderedListLabel}}
                @icon={{faListUl}}
                @size="sm"
                @color="light"
                @isIconOnly={{true}}
                {{tooltip @unorderedListLabel placement="bottom"}}
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
            @invalidLabel={{@invalidLabel}}
            @requiredLabel={{@requiredLabel}}
            @isInputOnly={{true}}
            @onChange={{@onChange}}
            rows="4"
            ...attributes
          />
          <p class="small text-secondary mt-2 mb-0">
            <Icon @icon={{faMarkdown}} @prefix="fab" />
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
