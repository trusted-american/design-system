import Helper from '@ember/component/helper';

import type { AnyFunction } from '@glint/template/-private/integration';

export default class StopPropagation extends Helper<{
  Args: { Positional: [fn?: () => void] };
  Return: AnyFunction;
}> {}
