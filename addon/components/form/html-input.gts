import type { TOC } from '@ember/component/template-only';
import { on } from '@ember/modifier';
import { action } from '@ember/object';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import {
  faBold,
  faCode,
  faHeading,
  faItalic,
  faListOl,
  faListUl,
  faParagraph,
  faQuoteLeft,
  faStrikethrough,
} from '@fortawesome/free-solid-svg-icons';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { Editor } from '@tiptap/core';
import StarterKit from '@tiptap/starter-kit';
import { modifier } from 'ember-modifier';
import { eq } from 'ember-truth-helpers';
import tooltip from '../../modifiers/tooltip';
import Button from '../button';
import Card from '../card';
import Nav from '../nav';
import FormFeedback from './feedback';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';
import FormTextarea from './textarea';

const EditorButton: TOC<{
  Args: {
    label: string;
    icon: IconDefinition;
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
      <card.header class="flex justify-between items-center">
        <Nav @isStatic={{true}} class="card-header-tabs" as |nav|>
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
              @icon={{faBold}}
              {{on "click" this.toggleBold}}
            />
            <EditorButton
              @label="Italic"
              @icon={{faItalic}}
              {{on "click" this.toggleItalic}}
            />
            <EditorButton
              @label="Strike"
              @icon={{faStrikethrough}}
              {{on "click" this.toggleStrike}}
            />
            <EditorButton
              @label="Heading"
              @icon={{faHeading}}
              {{on "click" this.toggleHeading}}
            />
            <EditorButton
              @label="Paragraph"
              @icon={{faParagraph}}
              {{on "click" this.setParagraph}}
            />
            <EditorButton
              @label="Quote"
              @icon={{faQuoteLeft}}
              {{on "click" this.toggleQuote}}
            />
            <EditorButton
              @label="Numbered list"
              @icon={{faListOl}}
              {{on "click" this.toggleNumberedList}}
            />
            <EditorButton
              @label="Unordered list"
              @icon={{faListUl}}
              {{on "click" this.toggleUnorderedList}}
            />
            <EditorButton
              @label="Code"
              @icon={{faCode}}
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
            class="form-html-input h-64 rounded overflow-auto resize-y px-3 py-1.5"
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
      class="hidden"
      aria-label={{@label}}
    />

    <FormFeedback @validLabel={{@validLabel}} @invalidLabel={{@invalidLabel}} />

    {{#each @errors as |error|}}
      <FormFeedback @validLabel={{undefined}} @invalidLabel={{error.message}} />
    {{/each}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
