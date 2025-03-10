import { get } from '@ember/helper';
import { isEqual, isEmpty, isPresent } from '@ember/utils';
import { breadcrumbs } from 'ember-breadcrumb-trail';
import Link from './link';

// TODO: simplify code from ember-composable-helpers

function getIndex<T>(array: T[], currentValue: T, useDeepEqual: boolean) {
  let needle = currentValue;

  if (useDeepEqual) {
    needle = array.find((object) => {
      return _isEqual(object, currentValue, useDeepEqual);
    }) as T;
  }

  const index = array.indexOf(needle);

  return index >= 0 ? index : null;
}

const _isEqual = (
  firstValue: unknown,
  secondValue: unknown,
  useDeepEqual = false,
) => {
  if (useDeepEqual) {
    return JSON.stringify(firstValue) === JSON.stringify(secondValue);
  } else {
    return isEqual(firstValue, secondValue) || isEqual(secondValue, firstValue);
  }
};

const next = <T,>(currentValue: T, array: T[], useDeepEqual = false) => {
  const currentIndex = getIndex(array, currentValue, useDeepEqual);
  const lastIndex = array.length - 1;

  if (null === currentIndex || isEmpty(currentIndex)) {
    return;
  }

  return currentIndex === lastIndex ? currentValue : array.at(currentIndex + 1);
};

const hasNext = <T,>(currentValue: T, array: T[], useDeepEqual = false) => {
  const nextValue = next(currentValue, array, useDeepEqual);
  const isNotSameValue = !_isEqual(nextValue, currentValue, useDeepEqual);

  return isNotSameValue && isPresent(nextValue);
};

const BreadcrumbTrail = <template>
  <nav aria-label="Breadcrumb" data-test-breadcrumb-trail>
    <ol class="breadcrumb">
      {{#each (breadcrumbs) as |breadcrumb|}}
        {{#if (hasNext breadcrumb (breadcrumbs))}}
          <li class="breadcrumb-item">
            <Link
              @route="{{get breadcrumb.data 'route'}}"
              @model={{get breadcrumb.data "model"}}
              @label={{breadcrumb.title}}
            />
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
