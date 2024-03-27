import Helper from '@ember/component/helper';

import type EmberArray from '@ember/array';

export default class SortBy<T, K extends keyof T> extends Helper<{
  Args: {
    Positional: [key: K | `${K & string}:desc`, arr: T[] | EmberArray<T>];
  };
  Return: T[];
}> {}
