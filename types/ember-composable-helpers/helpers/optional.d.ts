import Helper from '@ember/component/helper';

export default class Optional extends Helper<{
  Args: { Positional: [value?: unknown] };
  Return: () => void;
}> {}
