import Card from './card';
import Icon from './icon';
import Link, { type LinkArgs } from './link';
import type { TOC } from '@ember/component/template-only';
import type {
  IconDefinition,
  IconName,
} from '@fortawesome/fontawesome-svg-core';

interface Args extends LinkArgs {
  label: string;
  value?: string | number | null;
  icon?: IconName | IconDefinition;
}

export interface StatCardSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const StatCard: TOC<StatCardSignature> = <template>
  <Card
    class="bg-body-tertiary mb-4"
    data-test-stat-card
    ...attributes
    as |card|
  >
    <card.body>
      <div class="d-flex gap-2">
        <div class="flex-grow-1">
          <p class="card-title fw-semibold text-uppercase text-secondary">
            {{@label}}
          </p>
          <h1 class="mb-0">
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
