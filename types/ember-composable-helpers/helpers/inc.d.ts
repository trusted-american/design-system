import Helper from '@ember/component/helper';

export default class Inc extends Helper<{
  Args: { Positional: [value: number] };
  Return: number;
}> {}
