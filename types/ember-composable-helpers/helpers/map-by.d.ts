import Helper from '@ember/component/helper';

import type EmberArray from '@ember/array';

export default class MapBy<T, K extends keyof T> extends Helper<{
  Args: {
    // TODO: key
    Positional: [key: K | string, arr: T[] | EmberArray<T> | undefined];
  };
  Return: T[K][];
}> {}
