import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import { and, eq } from 'ember-truth-helpers';
import FormFeedback from './feedback';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';
import FormRadioInput from './radio/input';
import type { Option } from './select';

const decrement = (value: number) => value - 1;

export interface RadioOption<T> extends Option<T> {
  help?: string;
}

interface Args<T> extends FormInputArgs {
  options: RadioOption<T>[];
  selected: T | null | undefined;
  isInline?: boolean;
  onChange: (selected: T) => void;
}

export interface FormRadioSignature<T> {
  Args: Args<T>;
  Element: HTMLInputElement;
}

export default class FormRadio<T> extends Component<FormRadioSignature<T>> {
  <template>
    {{#unless @isInputOnly}}
      <FormLabel
        @label={{@label}}
        @identifier="{{@identifier}}0"
        @isRequired={{@isRequired}}
        @requiredLabel={{@requiredLabel}}
      />
    {{/unless}}

    <div>
      {{#each @options as |option index|}}
        <div class="{{if @isInline ''}}">
          <FormRadioInput
            @checked={{eq @selected option.value}}
            @name={{@identifier}}
            @identifier="{{@identifier}}{{index}}"
            @isRequired={{@isRequired}}
            {{on "change" (fn @onChange option.value)}}
            ...attributes
          />

          <FormLabel
            @label={{option.label}}
            @identifier="{{@identifier}}{{index}}"
            @requiredLabel={{@requiredLabel}}
            @isCheck={{true}}
          />

          {{#if option.help}}
            <FormHelp @label={{option.help}} class="mt-0" />
          {{/if}}

          {{#if (and @invalidLabel (eq (decrement @options.length) index))}}
            <FormFeedback
              @validLabel={{@validLabel}}
              @invalidLabel={{@invalidLabel}}
            />
          {{/if}}
        </div>
      {{/each}}
    </div>

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
