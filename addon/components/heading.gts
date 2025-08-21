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
  <div class="mb-6" data-test-heading ...attributes>
    {{#if @type}}
      <div class="flex justify-between items-end text-gray-500 mb-2">
        <span class="uppercase">
          {{@type}}
        </span>
        {{#if @identifier}}
          <span class="font-mono">
            {{@identifier}}
          </span>
        {{/if}}
      </div>
    {{/if}}

    <div class="flex justify-between items-start gap-4">
      <div>
        <h1 class="text-4xl font-bold">
          {{@title}}
        </h1>
      </div>
      {{yield}}
    </div>

    {{#if @subtitle}}
      <p class="mt-1">
        {{@subtitle}}
      </p>
    {{/if}}
  </div>
</template>;

export default Heading;
