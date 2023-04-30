declare module 'ember-truth-helpers/helpers/eq' {
  import Helper from '@ember/component/helper';

  export default class Eq extends Helper<{
    Args: { Positional: [...value: unknown[]] };
    Return: boolean;
  }> {}
}
