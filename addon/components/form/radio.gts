import Component from '@glimmer/component';
import FormLabel from './label';
import FormHelp from './help';
import FormFeedback from './feedback';
import FormRadioInput from './radio/input';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { dec } from '@nullvoxpopuli/ember-composable-helpers';
import { and, eq } from 'ember-truth-helpers';

import type { BaseArgs } from './input';
import type { Option } from './select';

export interface RadioOption<T> extends Option<T> {
  help?: string;
}

interface Args<T> extends BaseArgs {
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
    <FormLabel
      @label={{unless @isInputOnly @label}}
      @identifier="{{@identifier}}0"
      @isRequired={{@isRequired}}
    />

    <div>
      {{#each @options as |option index|}}
        <div class="form-check {{if @isInline 'form-check-inline'}}">
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
            @isCheck={{true}}
          />

          <FormHelp @label={{option.help}} class="mt-0" />

          {{#if (and @invalidFeedback (eq (dec @options.length) index))}}
            <FormFeedback @label={{@invalidFeedback}} />
          {{/if}}
        </div>
      {{/each}}
    </div>

    <FormHelp @label={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Radio': typeof FormRadio;
  }
}
