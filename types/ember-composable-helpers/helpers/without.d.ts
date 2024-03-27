import Helper from '@ember/component/helper';

export default class Without<T> extends Helper<{
  Args: {
    Positional: [obj: T | T[], arr: T[]];
  };
  Return: T[];
}> {}
