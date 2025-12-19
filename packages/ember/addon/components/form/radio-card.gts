import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import Component from '@glimmer/component';
import { eq } from 'ember-truth-helpers';
import Card from '../card';
import Icon from '../icon';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';
import type { RadioOption } from './radio';
import FormRadioInput from './radio/input';

interface RadioCardOption<T> extends RadioOption<T> {
  imgUrl?: string;
  icon?: IconDefinition;
}

interface Args<T> extends FormInputArgs {
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
        @for="{{@id}}0"
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
                  @name={{@id}}
                  @id="{{@id}}{{index}}"
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
