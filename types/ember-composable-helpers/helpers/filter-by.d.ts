import Helper from '@ember/component/helper';

import type EmberArray from '@ember/array';

export default class FilterBy<T, K extends keyof T> extends Helper<{
  Args: {
    Positional: [key: K, value: T[K] | boolean, arr: T[] | EmberArray<T>];
  };
  Return: T[];
}> {}
