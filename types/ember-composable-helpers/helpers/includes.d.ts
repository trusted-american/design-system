import Helper from '@ember/component/helper';

import type EmberArray from '@ember/array';

export default class Includes<T> extends Helper<{
  Args: {
    Positional: [searchElement: T, arr: T[] | EmberArray<T> | undefined];
  };
  Return: boolean;
}> {}
