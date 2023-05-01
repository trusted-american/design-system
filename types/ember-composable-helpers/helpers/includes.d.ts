declare module 'ember-composable-helpers/helpers/includes' {
  import Helper from '@ember/component/helper';

  export default class Includes extends Helper<{
    Args: { Positional: [...value: unknown[]] };
    Return: boolean;
  }> {}
}
