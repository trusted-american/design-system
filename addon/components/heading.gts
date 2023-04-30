import Component from '@glimmer/component';

export interface HeadingSignature {
  Element: HTMLDivElement;
  Args: {
    title: string;
    subtitle?: string;
    type?: string;
    code?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class Heading extends Component<HeadingSignature> {
  <template>
    <div class='mb-4' ...attributes>
      {{#if @type}}
        <div
          class='d-flex justify-content-between align-items-end text-secondary mb-2'
        >
          <h6 class='fw-normal text-uppercase mb-0'>
            {{@type}}
          </h6>
          {{#if @code}}
            <h6 class='fw-normal font-monospace mb-0'>
              {{@code}}
            </h6>
          {{/if}}
        </div>
      {{/if}}

      <div class='d-flex justify-content-between align-items-start'>
        <div>
          <h3 class='mb-0'>
            {{@title}}
          </h3>
          {{#if @subtitle}}
            <p class='mt-2 mb-0'>
              {{@subtitle}}
            </p>
          {{/if}}
        </div>
        {{yield}}
      </div>
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Heading: typeof Heading;
  }
}