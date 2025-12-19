import type { TOC } from '@ember/component/template-only';
import { fn } from '@ember/helper';
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

const setEditorContent = modifier<{
  Element: HTMLElement;
  Args: {
    Positional: [Editor | undefined, string | null];
  };
}>((_, [editor, value]) => {
  if (!editor) {
    return;
  }

  const { from, to } = editor.state.selection;
  editor.commands.setContent(value, {
    parseOptions: { preserveWhitespace: 'full' },
    emitUpdate: false,
  });
  editor.commands.setTextSelection({ from, to });
});

const toggleBold = (editor?: Editor) => {
  editor?.chain().focus().toggleBold().run();
};

const toggleItalic = (editor?: Editor) => {
  editor?.chain().focus().toggleItalic().run();
};

const toggleStrike = (editor?: Editor) => {
  editor?.chain().focus().toggleStrike().run();
};

const toggleHeading = (editor?: Editor) => {
  editor?.chain().focus().toggleHeading({ level: 3 }).run();
};

const setParagraph = (editor?: Editor) => {
  editor?.chain().focus().setParagraph().run();
};

const toggleQuote = (editor?: Editor) => {
  editor?.chain().focus().toggleBlockquote().run();
};

const toggleNumberedList = (editor?: Editor) => {
  editor?.chain().focus().toggleOrderedList().run();
};

const toggleUnorderedList = (editor?: Editor) => {
  editor?.commands.toggleBulletList();
};

const toggleCode = (editor?: Editor) => {
  editor?.chain().focus().toggleCode().run();
};

interface Args extends FormInputArgs {
  value: string | null;
  editorLabel: string;
  codeLabel: string;
  boldButtonLabel: string;
  italicButtonLabel: string;
  strikeButtonLabel: string;
  headingButtonLabel: string;
  paragraphButtonLabel: string;
  quoteButtonLabel: string;
  numberedListButtonLabel: string;
  unorderedListButtonLabel: string;
  codeButtonLabel: string;
  onChange: (value: string) => void;
}

export interface FormHtmlInputSignature {
  Args: Args;
  Element: HTMLElement;
}

export default class FormHtmlInput extends Component<FormHtmlInputSignature> {
  @tracked editor?: Editor;

  @tracked isCode = false;

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
        @for={{@id}}
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
              @label={{@boldButtonLabel}}
              @icon={{faBold}}
              {{on "click" (fn toggleBold this.editor)}}
            />
            <EditorButton
              @label={{@italicButtonLabel}}
              @icon={{faItalic}}
              {{on "click" (fn toggleItalic this.editor)}}
            />
            <EditorButton
              @label={{@strikeButtonLabel}}
              @icon={{faStrikethrough}}
              {{on "click" (fn toggleStrike this.editor)}}
            />
            <EditorButton
              @label={{@headingButtonLabel}}
              @icon={{faHeading}}
              {{on "click" (fn toggleHeading this.editor)}}
            />
            <EditorButton
              @label={{@paragraphButtonLabel}}
              @icon={{faParagraph}}
              {{on "click" (fn setParagraph this.editor)}}
            />
            <EditorButton
              @label={{@quoteButtonLabel}}
              @icon={{faQuoteLeft}}
              {{on "click" (fn toggleQuote this.editor)}}
            />
            <EditorButton
              @label={{@numberedListButtonLabel}}
              @icon={{faListOl}}
              {{on "click" (fn toggleNumberedList this.editor)}}
            />
            <EditorButton
              @label={{@unorderedListButtonLabel}}
              @icon={{faListUl}}
              {{on "click" (fn toggleUnorderedList this.editor)}}
            />
            <EditorButton
              @label={{@codeButtonLabel}}
              @icon={{faCode}}
              {{on "click" (fn toggleCode this.editor)}}
            />
          </div>
        {{/unless}}
      </card.header>
      <card.body class="p-0">
        {{#if this.isCode}}
          <FormTextarea
            @value={{@value}}
            @label={{@label}}
            @id={{@id}}
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
            {{setEditorContent this.editor @value}}
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
