declare module 'ember-truth-helpers/helpers/or' {
  import Helper from '@ember/component/helper';

  export default class Or extends Helper<{
    Args: { Positional: [...value: unknown[]] };
    Return: unknown;
  }> {}
}
