import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import type { Color } from '@trusted-american/core';
import { eq } from 'ember-truth-helpers';
import ButtonGroup from '../button-group';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';
import type { Option } from './select';

interface RadioOption<T> extends Option<T> {
  color?: Color;
}

interface Args<T> extends FormInputArgs {
  options: RadioOption<T>[];
  selected: T;
  onChange: (selected: T) => void;
}

export interface FormRadioButtonSignature<T> {
  Args: Args<T>;
  Element: HTMLDivElement;
}

export default class FormRadioButton<T> extends Component<
  FormRadioButtonSignature<T>
> {
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
      <ButtonGroup @size={{@size}} ...attributes as |buttonGroup|>
        {{#each @options as |option index|}}
          <input
            type="radio"
            class="btn-check"
            name={{@identifier}}
            id="{{@identifier}}{{index}}"
            autocomplete="off"
            checked={{eq @selected option.value}}
            {{on "change" (fn @onChange option.value)}}
          />
          <buttonGroup.button
            @label={{option.label}}
            @color={{option.color}}
            @isLabel={{true}}
            for="{{@identifier}}{{index}}"
          />
        {{/each}}
      </ButtonGroup>
    </div>

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
