declare module 'ember-composable-helpers/helpers/pick' {
  import Helper from '@ember/component/helper';

  export default class Pick extends Helper<{
    Args: { Positional: [string, (...args: never[]) => unknown] };
    Return: () => void;
  }> {}
}
