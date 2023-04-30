import Component from '@glimmer/component';
import FormLabel from './label';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
// @ts-ignore
import eq from 'ember-truth-helpers/helpers/eq';
// @ts-ignore
import and from 'ember-truth-helpers/helpers/and';
// @ts-ignore
import dec from 'ember-composable-helpers/helpers/dec';

import { Option } from '@trusted-american/design-system/components/form/select';

export interface FormRadioComponentSignature<T> {
  Element: HTMLElement;
  Args: {
    options: Option<T>[];
    selected?: T | null;
    inline?: boolean;
    label?: string;
    identifier: string;
    required?: boolean;
    invalidFeedback?: string;
    onChange: (selected: T) => void;
  };
}

export default class FormRadioComponent<T> extends Component<
  FormRadioComponentSignature<T>
> {
  <template>
    <div class='mb-3'>
      <FormLabel
        @text={{@label}}
        @identifier={{@identifier}}
        @required={{@required}}
      />

      {{#each @options as |option index|}}
        <div class='form-check {{if @inline "form-check-inline"}}'>
          <input
            class='form-check-input'
            type='radio'
            name={{@identifier}}
            id='{{@identifier}}{{index}}'
            checked={{eq @selected option.value}}
            required={{@required}}
            {{on 'change' (fn @onChange option.value)}}
            ...attributes
          />

          <label class='form-check-label' for='{{@identifier}}{{index}}'>
            {{option.label}}
          </label>

          {{#if (and @invalidFeedback (eq (dec @options.length) index))}}
            <div class='invalid-feedback'>
              {{@invalidFeedback}}
            </div>
          {{/if}}
        </div>
      {{/each}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Radio': typeof FormRadioComponent;
  }
}
