import Controller from '@ember/controller';

import type { ListAttributesKey } from '@trusted-american/design-system/components/list-attributes';

interface T {
  a: string;
  b: string;
  c: string;
}

export default class ComponentsListAttributesController extends Controller {
  selected: ListAttributesKey<T>[] = ['a'];
}
