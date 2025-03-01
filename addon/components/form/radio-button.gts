import Component from '@glimmer/component';
import Button from '../button';
import ButtonGroup from '../button-group';
import FormLabel from './label';
import FormHelp from './help';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';

import type { BaseArgs } from './input';
import type { Option } from './select';

interface RadioOption<T> extends Option<T> {
  color?: string;
}

interface Args<T> extends BaseArgs {
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
      <ButtonGroup @size={{@size}} ...attributes>
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
          <Button
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

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioButton': typeof FormRadioButton;
  }
}
