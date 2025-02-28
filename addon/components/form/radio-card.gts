import Component from '@glimmer/component';
import Card from '../card';
import Icon from '../icon';
import FormRadioInput from './radio/input';
import FormLabel from './label';
import FormHelp from './help';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';

import type { BaseArgs } from './input';
import type { RadioOption } from './radio';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

interface RadioCardOption<T> extends RadioOption<T> {
  imgUrl?: string;
  icon?: IconName;
}

interface Args<T> extends BaseArgs {
  options: RadioCardOption<T>[];
  selected: T | null | undefined;
  onChange: (selected: T) => void;
}

export interface FormRadioCardSignature<T> {
  Args: Args<T>;
  Element: HTMLDivElement;
}

export default class FormRadioCard<T> extends Component<
  FormRadioCardSignature<T>
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

    <div class="row g-3" ...attributes>

      {{#each @options as |option index|}}
        <div class="col">

          <label class="w-100">
            <Card class="text-center" as |card|>
              {{#if option.imgUrl}}
                <img
                  src={{option.imgUrl}}
                  alt={{option.label}}
                  class="card-img-top"
                />
              {{/if}}
              <card.body>
                {{#if option.icon}}
                  <h5 class="card-title">
                    <Icon @icon={{option.icon}} />
                  </h5>
                {{/if}}
                <h5
                  class="card-title {{unless option.help 'mb-0'}}"
                >{{option.label}}</h5>
                {{#if option.help}}
                  <p class="card-text">{{option.help}}</p>
                {{/if}}
              </card.body>
              <card.footer>
                <FormRadioInput
                  @checked={{eq @selected option.value}}
                  @name={{@identifier}}
                  @identifier="{{@identifier}}{{index}}"
                  @isRequired={{@isRequired}}
                  {{on "change" (fn @onChange option.value)}}
                />
              </card.footer>
            </Card>
          </label>

        </div>
      {{/each}}
    </div>

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioCard': typeof FormRadioCard;
  }
}
