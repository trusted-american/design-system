import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import Button from '../button';
import Card from '../card';
import Nav from '../nav';
import NavItem from '../nav/item';
import FormLabel from './label';
import FormTextarea from './textarea';
import FormFeedback from './feedback';
import FormHelp from './help';
import tooltip from '../../modifiers/tooltip';
import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';
import { modifier } from 'ember-modifier';
import { Editor } from '@tiptap/core';
import StarterKit from '@tiptap/starter-kit';

import type { FormInputArgs } from './input';
import type { TOC } from '@ember/component/template-only';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

const EditorButton: TOC<{
  Args: {
    label: string;
    icon: IconName;
  };
  Element: HTMLButtonElement | HTMLAnchorElement | HTMLLabelElement;
}> = <template>
  <Button
    @label={{@label}}
    @icon={{@icon}}
    @size="sm"
    @color="light"
    @isIconOnly={{true}}
    {{tooltip @label placement="bottom"}}
    ...attributes
  />
</template>;

interface Args extends FormInputArgs {
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

  editor?: Editor;

  setup = modifier((element) => {
    if (this.editor) {
      return;
    }

    const editor = new Editor({
      element,
      extensions: [StarterKit],
      content: this.args.value,
      onUpdate: ({ editor }) => {
        const value = editor.getHTML();
        this.args.onChange(value);
      },
    });

    this.editor = editor;

    return () => {
      const element = document.querySelector('.tiptap');
      if (!element) {
        editor.destroy();
        this.editor = undefined;
      }
    };
  });

  @action
  toggleBold() {
    this.editor?.chain().focus().toggleBold().run();
  }

  @action
  toggleItalic() {
    this.editor?.chain().focus().toggleItalic().run();
  }

  @action
  toggleStrike() {
    this.editor?.chain().focus().toggleStrike().run();
  }

  @action
  toggleHeading() {
    this.editor?.chain().focus().toggleHeading({ level: 3 }).run();
  }

  @action
  setParagraph() {
    this.editor?.chain().focus().setParagraph().run();
  }

  @action
  toggleQuote() {
    this.editor?.chain().focus().toggleBlockquote().run();
  }

  @action
  toggleNumberedList() {
    this.editor?.chain().focus().toggleOrderedList().run();
  }

  @action
  toggleUnorderedList() {
    this.editor?.commands.toggleBulletList();
  }

  @action
  toggleCode() {
    this.editor?.chain().focus().toggleCode().run();
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
        @requiredLabel={{@requiredLabel}}
      />
    {{/unless}}

    <Card as |card|>
      <card.header class="d-flex justify-content-between align-items-center">
        <Nav class="card-header-tabs" as |nav|>
          <nav.item
            @label={{@editorLabel}}
            class={{if (eq false this.isCode) "active"}}
            data-test-editor
            {{on "click" this.setEditor}}
          />
          <nav.item
            @label={{@codeLabel}}
            class={{if (eq true this.isCode) "active"}}
            data-test-code
            {{on "click" this.setCode}}
          />
        </Nav>

        {{#unless this.isCode}}
          <div>
            <EditorButton
              @label="Bold"
              @icon="bold"
              {{on "click" this.toggleBold}}
            />
            <EditorButton
              @label="Italic"
              @icon="italic"
              {{on "click" this.toggleItalic}}
            />
            <EditorButton
              @label="Strike"
              @icon="strikethrough"
              {{on "click" this.toggleStrike}}
            />
            <EditorButton
              @label="Heading"
              @icon="heading"
              {{on "click" this.toggleHeading}}
            />
            <EditorButton
              @label="Paragraph"
              @icon="paragraph"
              {{on "click" this.setParagraph}}
            />
            <EditorButton
              @label="Quote"
              @icon="quote-right"
              {{on "click" this.toggleQuote}}
            />
            <EditorButton
              @label="Numbered list"
              @icon="list-ol"
              {{on "click" this.toggleNumberedList}}
            />
            <EditorButton
              @label="Unordered list"
              @icon="list-ul"
              {{on "click" this.toggleUnorderedList}}
            />
            <EditorButton
              @label="Code"
              @icon="code"
              {{on "click" this.toggleCode}}
            />
          </div>
        {{/unless}}
      </card.header>
      <card.body class="p-0">
        {{#if this.isCode}}
          <FormTextarea
            @value={{@value}}
            @label={{@label}}
            @identifier={{@identifier}}
            @isRequired={{@isRequired}}
            @requiredLabel={{@requiredLabel}}
            @isInputOnly={{true}}
            @onChange={{@onChange}}
            class="border-0"
            ...attributes
          />
        {{else}}
          <div
            class="form-html-input"
            data-test-value-editor
            {{this.setup}}
            ...attributes
          ></div>
        {{/if}}
      </card.body>
    </Card>

    {{! hidden input for validation }}
    <input
      value="{{@value}}"
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
