import { get } from '@ember/helper';
import { LinkTo } from '@ember/routing';
import { breadcrumbs } from 'ember-breadcrumb-trail';
import { hasNext } from '@nullvoxpopuli/ember-composable-helpers';

const BreadcrumbTrail = <template>
  <nav aria-label="Breadcrumb" data-test-breadcrumb-trail>
    <ol class="breadcrumb">
      {{#each (breadcrumbs) as |breadcrumb|}}
        {{#if (hasNext breadcrumb (breadcrumbs))}}
          <li class="breadcrumb-item">
            {{#if (get breadcrumb.data "model")}}
              <LinkTo
                @route="{{get breadcrumb.data 'route'}}"
                @model={{get breadcrumb.data "model"}}
              >
                {{breadcrumb.title}}
              </LinkTo>
            {{else}}
              <LinkTo @route="{{get breadcrumb.data 'route'}}">
                {{breadcrumb.title}}
              </LinkTo>
            {{/if}}
          </li>
        {{else}}
          <li class="breadcrumb-item active" aria-current="page">
            {{breadcrumb.title}}
          </li>
        {{/if}}
      {{/each}}
    </ol>
  </nav>
</template>;

export default BreadcrumbTrail;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    BreadcrumbTrail: typeof BreadcrumbTrail;
  }
}
