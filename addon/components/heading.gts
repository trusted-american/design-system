import type { TOC } from '@ember/component/template-only';

export interface HeadingSignature {
  Args: {
    title: string;
    subtitle?: string;
    type?: string;
    identifier?: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const Heading: TOC<HeadingSignature> = <template>
  <div class="mb-4" data-test-heading ...attributes>
    {{#if @type}}
      <div
        class="d-flex justify-content-between align-items-end text-secondary mb-2"
      >
        <span class="text-uppercase">
          {{@type}}
        </span>
        {{#if @identifier}}
          <span class="font-monospace">
            {{@identifier}}
          </span>
        {{/if}}
      </div>
    {{/if}}

    <div class="d-flex justify-content-between align-items-start gap-3">
      <div>
        <h1 class="mb-0">
          {{@title}}
        </h1>
      </div>
      {{yield}}
    </div>

    {{#if @subtitle}}
      <p class="lead mt-1 mb-0">
        {{@subtitle}}
      </p>
    {{/if}}
  </div>
</template>;

export default Heading;
