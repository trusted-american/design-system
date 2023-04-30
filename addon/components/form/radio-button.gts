import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { fn, concat } from '@ember/helper';
import eq from 'ember-truth-helpers/helpers/eq';

import type { Option } from '@trusted-american/design-system/components/form/select';

export interface FormRadioButtonSignature<T> {
  Element: HTMLDivElement;
  Args: {
    options: Option<T>[];
    selected: T;
    identifier: string;
    size?: 'sm' | 'lg';
    color?: string;
    onChange: (selected: T) => void;
  };
}

export default class FormRadioButton<T> extends Component<
  FormRadioButtonSignature<T>
> {
  <template>
    <div
      class='btn-group {{if @size (concat "btn-group-" @size)}}'
      role='group'
      ...attributes
    >
      {{#each @options as |option index|}}
        <input
          type='radio'
          class='btn-check'
          name={{@identifier}}
          id='{{@identifier}}-{{index}}'
          autocomplete='off'
          checked={{eq @selected option.value}}
          {{on 'change' (fn @onChange option.value)}}
        />
        <label
          class='btn btn-{{if @color @color "secondary"}}'
          for='{{@identifier}}-{{index}}'
        >
          {{option.label}}
        </label>
      {{/each}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioButton': typeof FormRadioButton;
  }
}
