import Helper from '@ember/component/helper';

export default class Keys extends Helper<{
  Args: {
    Positional: [Record<string, unknown>];
  };
  Return: string[];
}> {}
