import Helper from '@ember/component/helper';

export default class ObjectAt extends Helper<{
  Args: { Positional: [...value: unknown[]] };
  Return: unknown;
}> {}
