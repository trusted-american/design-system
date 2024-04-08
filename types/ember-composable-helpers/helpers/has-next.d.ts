import Helper from '@ember/component/helper';

export default class HasNext extends Helper<{
  Args: {
    Positional: [unknown, unknown[]];
  };
  Return: boolean;
}> {}
