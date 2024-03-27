import Helper from '@ember/component/helper';

export default class Breadcrumb extends Helper<{
  Args: {
    Positional: [title: string];
    Named: Record<string, unknown>;
  };
  Return: never;
}> {}
