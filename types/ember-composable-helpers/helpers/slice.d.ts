import Helper from '@ember/component/helper';

import type EmberArray from '@ember/array';

export default class Slice<T> extends Helper<{
  Args: {
    Positional:
      | [a: number, arr: T[] | EmberArray<T>]
      | [a: number, b: number, arr: T[] | EmberArray<T>];
  };
  Return: T[];
}> {}
