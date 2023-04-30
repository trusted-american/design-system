declare module 'ember-truth-helpers/helpers/not' {
  import Helper from '@ember/component/helper';

  export default class Not extends Helper<{
    Args: { Positional: [...value: unknown[]] };
    Return: boolean;
  }> {}
}
