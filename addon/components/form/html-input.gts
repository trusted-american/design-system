import type { TOC } from '@ember/component/template-only';
import { on } from '@ember/modifier';
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

const handleChange = modifier<{
  Element: HTMLElement;
  Args: {
    Positional: [Editor | undefined, string | null];
  };
}>((_, [editor, value]) => {
  editor?.commands.setContent(value); // TODO: not working after second render
});

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
    const editor = new Editor({
      element,
      extensions: [StarterKit],
      onUpdate: ({ editor }) => {
        const value = editor.getHTML();
        this.args.onChange(value);
      },
    });

    this.editor = editor;

    return () => {
      editor.destroy();
      this.editor = undefined;
    };
  });

  toggleBold = () => {
    this.editor?.chain().focus().toggleBold().run();
  };

  toggleItalic = () => {
    this.editor?.chain().focus().toggleItalic().run();
  };

  toggleStrike = () => {
    this.editor?.chain().focus().toggleStrike().run();
  };

  toggleHeading = () => {
    this.editor?.chain().focus().toggleHeading({ level: 3 }).run();
  };

  setParagraph = () => {
    this.editor?.chain().focus().setParagraph().run();
  };

  toggleQuote = () => {
    this.editor?.chain().focus().toggleBlockquote().run();
  };

  toggleNumberedList() {
    this.editor?.chain().focus().toggleOrderedList().run();
  }

  toggleUnorderedList = () => {
    this.editor?.commands.toggleBulletList();
  };

  toggleCode = () => {
    this.editor?.chain().focus().toggleCode().run();
  };

  setEditor = (event: Event) => {
    event.preventDefault();
    this.isCode = false;
  };

  setCode = (event: Event) => {
    event.preventDefault();
    this.isCode = true;
  };

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
          <div class="overflow-x-auto d-flex gap-1">
            <EditorButton
              {{! TODO: string }}
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
            class="form-html-input"
            data-test-value-editor
            {{this.setup}}
            {{handleChange this.editor @value}}
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

    <FormFeedback @validLabel={{@validLabel}} @invalidLabel={{@invalidLabel}} />

    {{#each @errors as |error|}}
      <FormFeedback @validLabel={{undefined}} @invalidLabel={{error.message}} />
    {{/each}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
