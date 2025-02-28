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
import PellEditor from 'ember-pell/components/pell-editor';
import { eq } from 'ember-truth-helpers';
import { modifier } from 'ember-modifier';
import { Editor } from '@tiptap/core';
import StarterKit from '@tiptap/starter-kit';

import type { BaseArgs } from './input';
import type { TOC } from '@ember/component/template-only';

const EditorButton: TOC<{
  Args: {
    label: string;
    icon: string;
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
      // editor.destroy();
      // this.editor = undefined;
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
  setParagraph() {
    this.editor?.chain().focus().setParagraph().run();
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
    <FormLabel
      @label={{unless @isInputOnly @label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
    />

    <Card as |card|>
      <card.header class="d-flex justify-content-between align-items-center">
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
              @label="Paragraph"
              @icon="paragraph"
              {{on "click" this.setParagraph}}
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

          <PellEditor
            @value={{@value}}
            @onChange={{@onChange}}
            data-test-value-editor
            ...attributes
          />
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

    <FormFeedback @label={{@invalidFeedback}} />

    {{#each @errors as |error|}}
      <FormFeedback @label={{error.message}} />
    {{/each}}

    <FormHelp @label={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::HtmlInput': typeof FormHtmlInput;
  }
}
