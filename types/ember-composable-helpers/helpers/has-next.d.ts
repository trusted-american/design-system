import Helper from '@ember/component/helper';

export default class HasNextHelper extends Helper<{
  Args: { Positional: [unknown, unknown[]] };
  Return: boolean;
}> {}
