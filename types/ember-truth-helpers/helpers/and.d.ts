declare module 'ember-truth-helpers/helpers/and' {
  import Helper from '@ember/component/helper';

  export default class And extends Helper<{
    Args: { Positional: [...value: unknown[]] };
    Return: boolean;
  }> {}
}
