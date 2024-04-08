import Helper from '@ember/component/helper';

export default class FindBy<T> extends Helper<{
  Args: {
    Positional: [byPath: unknown, value: string | undefined, arr: unknown];
  };
  Return: T | undefined;
}> {}
