import { get } from '@ember/helper';
import { breadcrumbs } from 'ember-breadcrumb-trail';
import { hasNext } from '@nullvoxpopuli/ember-composable-helpers';
import Link from './link';

const BreadcrumbTrail = <template>
  <nav aria-label="Breadcrumb" data-test-breadcrumb-trail>
    <ol class="breadcrumb">
      {{#each (breadcrumbs) as |breadcrumb|}}
        {{#if (hasNext breadcrumb (breadcrumbs))}}
          <li class="breadcrumb-item" data-test-breadcrumb-trail-item>
            <Link
              @route="{{get breadcrumb.data 'route'}}"
              @model={{get breadcrumb.data "model"}}
              @label={{breadcrumb.title}}
            />
          </li>
        {{else}}
          <li
            class="breadcrumb-item active"
            aria-current="page"
            data-test-breadcrumb-trail-item
          >
            {{breadcrumb.title}}
          </li>
        {{/if}}
      {{/each}}
    </ol>
  </nav>
</template>;

export default BreadcrumbTrail;
