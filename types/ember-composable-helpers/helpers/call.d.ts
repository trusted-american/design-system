import Helper from '@ember/component/helper';

import type { AnyFunction } from '@glint/template/-private/integration';

export default class Call<T extends AnyFunction> extends Helper<{
  Args: {
    Positional: [fn: T];
  };
  Return: ReturnType<T>;
}> {}
