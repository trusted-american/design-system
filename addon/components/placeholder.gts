import Component from '@glimmer/component';
import Icon from './icon';
import Button from './button';
import htmlSafe from '../helpers/html-safe';
import { on } from '@ember/modifier';
import { and } from 'ember-truth-helpers';

export interface PlaceholderSignature {
  Args: {
    icon: string;
    title: string;
    subtitle?: string;
    buttonLabel?: string;
    secondaryButtonLabel?: string;
    onClick?: () => void;
    onSecondaryClick?: () => void;
  };
  Element: HTMLElement;
}

export default class Placeholder extends Component<PlaceholderSignature> {
  <template>
    <div
      class="d-flex justify-content-center"
      data-test-placeholder
      ...attributes
    >
      <div class="text-center" style={{htmlSafe "max-width: 25rem;"}}>
        <h1 class="mb-3">
          <Icon @icon={{@icon}} />
        </h1>
        <h4 class="mb-0" data-test-title>
          {{@title}}
        </h4>
        {{#if @subtitle}}
          <p class="text-secondary mt-2 mb-0" data-test-subtitle>
            {{@subtitle}}
          </p>
        {{/if}}
        {{#if @onClick}}
          {{#if @buttonLabel}}
            <Button
              @label={{@buttonLabel}}
              @color="success"
              class="mt-3"
              {{on "click" @onClick}}
            />
          {{/if}}
        {{/if}}
        {{#if (and @onClick @onSecondaryClick)}}
          <br />
        {{/if}}
        {{#if @onSecondaryClick}}
          {{#if @secondaryButtonLabel}}
            <Button
              @label={{@secondaryButtonLabel}}
              @color="link"
              class="mt-3"
              {{on "click" @onSecondaryClick}}
            />
          {{/if}}
        {{/if}}
      </div>
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Placeholder: typeof Placeholder;
  }
}
