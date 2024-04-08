import Helper from '@ember/component/helper';

export default class Noop extends Helper<{
  Return: () => void;
}> {}
