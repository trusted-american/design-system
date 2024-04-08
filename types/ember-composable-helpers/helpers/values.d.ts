import Helper from '@ember/component/helper';

export default class Values extends Helper<{
  Args: {
    Positional: [Record<string, unknown>];
  };
  Return: string[];
}> {}
