import { helper } from '@ember/component/helper';

/**
 * Returns sorted array.
 */
const sort = helper(<T>([arr]: [T[]]): T[] => arr.sort());

export default sort;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    sort: typeof sort;
  }
}
