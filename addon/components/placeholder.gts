import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import Button from './button';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';

export interface PlaceholderSignature {
  Element: HTMLElement;
  Args: {
    icon: string;
    title: string;
    subtitle?: string;
    onClick?: () => void;
  };
}

export default class Placeholder extends Component<PlaceholderSignature> {
  <template>
    <div
      class='d-flex justify-content-center text-secondary'
      data-test-placeholder
      ...attributes
    >
      {{! template-lint-disable no-inline-styles }}
      <div class='text-center' style='max-width: 22rem;'>
        <h1>
          <FaIcon @icon={{@icon}} data-test-icon />
        </h1>
        <h6 class='h5 mb-0' data-test-title>
          {{@title}}
        </h6>
        {{#if @subtitle}}
          <p class='mt-2 mb-0' data-test-subtitle>
            {{@subtitle}}
          </p>
        {{/if}}
        {{#if @onClick}}
          <Button
            @text='Create'
            @icon='plus'
            class='mt-3'
            {{on 'click' @onClick}}
          />
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
