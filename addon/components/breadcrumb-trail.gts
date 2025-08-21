import { get } from '@ember/helper';
import { LinkTo } from '@ember/routing';
import { isEmpty, isEqual, isPresent } from '@ember/utils';
import { breadcrumbs } from 'ember-breadcrumb-trail';

// TODO: simplify code from ember-composable-helpers
const hasNext = <T,>(currentValue: T, array: T[]) => {
  const getIndex = <T,>(array: T[], currentValue: T) => {
    const needle = currentValue;
    const index = array.indexOf(needle);
    return index >= 0 ? index : null;
  };

  const _isEqual = (firstValue: unknown, secondValue: unknown) => {
    return isEqual(firstValue, secondValue) || isEqual(secondValue, firstValue);
  };

  const next = <T,>(currentValue: T, array: T[]) => {
    const currentIndex = getIndex(array, currentValue);
    const lastIndex = array.length - 1;
    if (null === currentIndex || isEmpty(currentIndex)) {
      return;
    }
    return currentIndex === lastIndex
      ? currentValue
      : array.at(currentIndex + 1);
  };

  const nextValue = next(currentValue, array);
  const isNotSameValue = !_isEqual(nextValue, currentValue);
  return isNotSameValue && isPresent(nextValue);
};

const BreadcrumbTrail = <template>
  <nav aria-label="Breadcrumb" data-test-breadcrumb-trail>
    <ol class="flex gap-4">
      {{#each (breadcrumbs) as |breadcrumb|}}
        {{#if (hasNext breadcrumb (breadcrumbs))}}
          <li class="breadcrumb-item" data-test-breadcrumb-trail-item>
            {{! using <Link /> here causes missing url param errors when transitioning }}
            {{#if (get breadcrumb.data "model")}}
              <LinkTo
                @route="{{get breadcrumb.data 'route'}}"
                @model={{get breadcrumb.data "model"}}
                class="text-blue-500 underline"
              >
                {{breadcrumb.title}}
              </LinkTo>
            {{else}}
              <LinkTo
                @route="{{get breadcrumb.data 'route'}}"
                class="text-blue-500 underline"
              >
                {{breadcrumb.title}}
              </LinkTo>
            {{/if}}
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
