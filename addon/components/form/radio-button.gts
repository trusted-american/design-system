import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import { eq } from 'ember-truth-helpers';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';
import type { Option } from './select';

interface RadioOption<T> extends Option<T> {
  color?: string;
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
      <div class="flex flex-wrap" ...attributes>
        {{#each @options as |option index|}}
          <label class="inline-flex items-center cursor-pointer">
            <input
              type="radio"
              class="sr-only peer"
              name={{@identifier}}
              id="{{@identifier}}{{index}}"
              autocomplete="off"
              checked={{eq @selected option.value}}
              {{on "change" (fn @onChange option.value)}}
            />
            <span
              class="px-4 py-2 border-2 border-gray-300 bg-white text-gray-700 peer-checked:bg-blue-600 peer-checked:border-blue-600 peer-checked:text-white hover:bg-gray-50 peer-checked:hover:bg-blue-700 font-medium text-sm cursor-pointer
                {{if (eq index 0) 'rounded-l-lg' 'rounded-r-lg'}}"
            >
              {{option.label}}
            </span>
          </label>
        {{/each}}
      </div>
    </div>

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
