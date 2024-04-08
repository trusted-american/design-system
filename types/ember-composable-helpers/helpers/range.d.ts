import Helper from '@ember/component/helper';

export default class Range extends Helper<{
  Args: { Positional: [number, number] };
  Return: number[];
}> {}
