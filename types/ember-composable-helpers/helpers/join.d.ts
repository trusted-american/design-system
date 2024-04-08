import Helper from '@ember/component/helper';

export default class Join extends Helper<{
  Args: { Positional: [string, unknown[]] };
  Return: string;
}> {}
