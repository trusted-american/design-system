import Component from '@glimmer/component';
import FormLabel from './label';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
// @ts-ignore
import eq from 'ember-truth-helpers/helpers/eq';
// @ts-ignore
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';

import { Option } from '@trusted-american/design-system/components/form/select';

interface RadioCardOption<T> extends Option<T> {
  imgUrl?: string;
  icon?: string;
  help?: string;
}

export interface FormRadioCardComponentSignature<T> {
  Element: HTMLDivElement;
  Args: {
    options: RadioCardOption<T>[];
    selected?: T | null;
    label?: string;
    identifier: string;
    required?: boolean;
    onChange: (selected: T) => void;
  };
}

export default class FormRadioCardComponent<T> extends Component<
  FormRadioCardComponentSignature<T>
> {
  <template>
    <FormLabel
      @text={{@label}}
      @identifier={{@identifier}}
      @required={{@required}}
    />

    <div class="row g-3" ...attributes>

      {{#each @options as |option index|}}
        <div class="col">

          <label class="w-100">
            <div class="card text-center">
              {{#if option.imgUrl}}
                <img
                  src={{option.imgUrl}}
                  alt={{option.label}}
                  class="card-img-top"
                />
              {{/if}}
              <div class="card-body">
                {{#if option.icon}}
                  <h5 class="card-title">
                    <FaIcon @icon={{option.icon}} />
                  </h5>
                {{/if}}
                <h5 class="card-title">{{option.label}}</h5>
                {{#if option.help}}
                  <p class="card-text">{{option.help}}</p>
                {{/if}}
              </div>
              <div class="card-footer">
                <input
                  class="form-check-input"
                  type="radio"
                  name={{@identifier}}
                  id="{{@identifier}}{{index}}"
                  checked={{eq @selected option.value}}
                  required={{@required}}
                  {{on "change" (fn @onChange option.value)}}
                />
              </div>
            </div>
          </label>

        </div>
      {{/each}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioCard': typeof FormRadioCardComponent;
  }
}
