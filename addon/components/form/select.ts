import Component from '@glimmer/component';
import { assert } from '@ember/debug';
import { typeOf } from '@ember/utils';
import { action } from '@ember/object';

export interface Option<T = unknown> {
  value: T;
  label: string;
}

interface Args<T> {
  selected: T | null | undefined;
  label: string;
  identifier: string;
  required?: boolean;
  help?: string;
  invalidFeedback?: string;
  inputOnly?: boolean;
  size?: 'sm' | 'lg';
  onChange: (value: never) => void;
}

interface ComplexArgs<T> extends Args<T> {
  options: Option<T>[];
  simple?: undefined;
}

interface SimpleArgs extends Args<string> {
  options: string[];
  simple: true;
}

export interface FormSelectSignature<T> {
  Args: ComplexArgs<T> | SimpleArgs;
  Element: HTMLSelectElement;
}

export default class FormSelect<T> extends Component<FormSelectSignature<T>> {
  constructor(owner: unknown, args: FormSelectSignature<T>['Args']) {
    super(owner, args);
    assert(
      '<Form::Select />: Must pass an options array',
      typeOf(this.args.options) === 'array',
    );
    // assert(
    //   '<Form::Select />: Must pass a selected string or undefined',
    //   typeOf(this.args.selected) === 'string' ||
    //     this.args.selected === undefined ||
    //     this.args.selected === null
    // );
    assert(
      '<Form::Select />: Must pass a label string or undefined',
      typeOf(this.args.label) === 'string' || this.args.label === undefined,
    );
    assert(
      '<Form::Select />: Must pass an onChange function',
      typeOf(this.args.onChange) === 'function',
    );
  }

  @action
  change({ target }: Event): void {
    const index = parseInt((target as HTMLFormElement)['value'] as string);

    const options = this.args.options as Option[];
    const selected = options[index];

    if (selected) {
      this.args.onChange(selected.value as never);
    } else {
      this.args.onChange(options[0]?.value as never);
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Select': typeof FormSelect;
  }
}
