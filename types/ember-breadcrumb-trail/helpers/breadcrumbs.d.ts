import Helper from '@ember/component/helper';

export default class Breadcrumbs extends Helper<{
  Return: { title: string; data: { route: string; model: string } }[];
}> {}
