import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormLabel from './label';
import FormFeedback from './feedback';
import FormHelp from './help';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq, or } from 'ember-truth-helpers';

export interface BaseArgs {
  label: string;
  identifier: string;
  isRequired?: boolean;
  help?: string;
  invalidFeedback?: string;
  requiredLabel: string;
  size?: 'sm' | 'lg';
  isInputOnly?: boolean;
  errors?: { message: string }[];
}

interface Args extends BaseArgs {
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
            @invalidFeedback
            ' has-validation'
          }}"
      >

        {{#if (has-block)}}
          <span class="input-group-text">
            {{yield}}
          </span>
        {{/if}}

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
          {{on "input" this.change}}
          ...attributes
        />
        {{yield to="actions"}}

        {{#if @invalidFeedback}}
          <FormFeedback @label={{@invalidFeedback}} />
        {{/if}}

        {{#each @errors as |error|}}
          <FormFeedback @label={{error.message}} />
        {{/each}}

      </div>
    {{else}}
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
        {{on "input" this.change}}
        ...attributes
      />

      {{#if @invalidFeedback}}
        <FormFeedback @label={{@invalidFeedback}} />
      {{/if}}

      {{#each @errors as |error|}}
        <FormFeedback @label={{error.message}} />
      {{/each}}
    {{/if}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Input': typeof FormInput;
  }
}
