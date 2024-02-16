import Helper from '@ember/component/helper';

import type { AnyFunction } from '@glint/template/-private/integration';

export default class PreventDefault extends Helper<{
  Args: { Positional: [() => void] };
  Return: AnyFunction;
}> {}
