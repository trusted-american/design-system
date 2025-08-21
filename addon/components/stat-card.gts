import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import Card from './card';
import Icon from './icon';
import Link, { type LinkArgs } from './link';

interface Args extends LinkArgs {
  label: string;
  value?: string | number | null;
  icon?: IconDefinition;
}

export interface StatCardSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const StatCard: TOC<StatCardSignature> = <template>
  <Card class="bg-gray-100 mb-6" data-test-stat-card ...attributes as |card|>
    <card.body>
      <div class="flex gap-2">
        <div class="flex-grow">
          <p class="font-semibold uppercase text-gray-500 mb-4">
            {{@label}}
          </p>
          <h1 class="text-4xl font-bold">
            {{#if @value}}
              {{@value}}
            {{else if (has-block)}}
              {{yield}}
            {{else}}
              &mdash;
            {{/if}}
          </h1>
        </div>
        {{#if @icon}}
          <div>
            <Icon @icon={{@icon}} @color="body" @size="3x" />
          </div>
        {{/if}}
      </div>
      {{#if @route}}
        <Link
          @route={{@route}}
          @model={{@model}}
          @query={{@query}}
          @href={{@href}}
          @isLocalHref={{@isLocalHref}}
          class="stretched-link"
          aria-label={{@label}}
        />
      {{/if}}
    </card.body>
  </Card>
</template>;

export default StatCard;
