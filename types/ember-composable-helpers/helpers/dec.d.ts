import Helper from '@ember/component/helper';

import type Ember from 'ember';

export default class Dec extends Helper<{
  Args: {
    Positional: [value: number | Ember.ComputedProperty<number, number>];
  };
  Return: number;
}> {}
