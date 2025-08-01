import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';
import { action } from '@ember/object';
import Component from '@glimmer/component';
import { eq, or } from 'ember-truth-helpers';
import FormFeedback from './feedback';
import FormHelp from './help';
import FormLabel from './label';

export interface FormInputArgs {
  label: string;
  identifier: string;
  isRequired?: boolean;
  requiredLabel: string;
  help?: string;
  validLabel?: string;
  invalidLabel?: string;
  isInputOnly?: boolean;
  size?: 'sm' | 'lg';
  errors?: { message: string }[];
}

const Internal: TOC<{
  Args: {
    value: string | null | undefined;
    type: string | undefined;
    label: string;
    identifier: string;
    isRequired: boolean | undefined;
    isInputOnly: boolean | undefined;
    size: 'sm' | 'lg' | undefined;
    errors: { message: string }[] | undefined;
    onChange: (event: Event) => void;
  };
  Element: HTMLInputElement;
}> = <template>
  <input
    type={{if @type @type "text"}}
    id={{@identifier}}
    value={{@value}}
    class="{{if (eq 'range' @type) 'form-range' 'form-control'}}{{if
        @size
        (concat ' form-control-' @size)
      }}{{if (eq 'color' @type) ' form-control-color'}}{{if
        @errors
        ' is-invalid'
      }}
      flex-nowrap"
    required={{@isRequired}}
    aria-label={{if @isInputOnly @label}}
    data-test-form-input
    {{on "input" @onChange}}
    ...attributes
  />
</template>;

interface Args extends FormInputArgs {
  value: string | null | undefined;
  type?: string;
  onChange: (value: string) => void;
}

export interface FormInputSignature {
  Args: Args;
  Blocks: {
    default: [];
    actions: [];
  };
  Element: HTMLInputElement;
}

export default class FormInput extends Component<FormInputSignature> {
  @action
  change({ target }: Event): void {
    if (!(target instanceof HTMLInputElement)) {
      throw new Error();
    }
    this.args.onChange(target.value);
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

    {{#if (or (has-block) (has-block "actions"))}}
      <div
        class="input-group{{if @size (concat ' input-group-' @size)}}{{if
            @invalidLabel
            ' has-validation'
          }}"
      >
        {{#if (has-block)}}
          <span class="input-group-text">
            {{yield}}
          </span>
        {{/if}}

        <Internal
          @value={{@value}}
          @type={{@type}}
          @label={{@label}}
          @identifier={{@identifier}}
          @isRequired={{@isRequired}}
          @isInputOnly={{@isInputOnly}}
          @size={{@size}}
          @errors={{@errors}}
          @onChange={{this.change}}
          ...attributes
        />
        {{yield to="actions"}}

        <FormFeedback
          @validLabel={{@validLabel}}
          @invalidLabel={{@invalidLabel}}
        />

        {{#each @errors as |error|}}
          <FormFeedback
            @validLabel={{undefined}}
            @invalidLabel={{error.message}}
          />
        {{/each}}
      </div>
    {{else}}
      <Internal
        @value={{@value}}
        @type={{@type}}
        @label={{@label}}
        @identifier={{@identifier}}
        @isRequired={{@isRequired}}
        @isInputOnly={{@isInputOnly}}
        @size={{@size}}
        @errors={{@errors}}
        @onChange={{this.change}}
        ...attributes
      />

      <FormFeedback
        @validLabel={{@validLabel}}
        @invalidLabel={{@invalidLabel}}
      />

      {{#each @errors as |error|}}
        <FormFeedback
          @validLabel={{undefined}}
          @invalidLabel={{error.message}}
        />
      {{/each}}
    {{/if}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
