import Component from '@glimmer/component';
import { assert } from '@ember/debug';
import { typeOf } from '@ember/utils';
import { action } from '@ember/object';
import FormLabel from './label';
import FormError from './error';
import FormHelp from './help';
import { on } from '@ember/modifier';
import { concat } from '@ember/helper';
import eq from 'ember-truth-helpers/helpers/eq';
import not from 'ember-truth-helpers/helpers/not';
import or from 'ember-truth-helpers/helpers/or';
// @ts-ignore
import pick from 'ember-composable-helpers/helpers/pick';

export interface Option<T = unknown> {
  value: T;
  label: string;
}

interface Args {
  selected?: unknown;
  label?: string;
  identifier: string;
  required?: boolean;
  disabled?: boolean;
  size?: 'sm' | 'lg';
  help?: string;
  invalidFeedback?: string;
  onChange: (value: never) => void;
}

interface ComplexArgs extends Args {
  options: Option[];
  simple?: undefined;
}

interface SimpleArgs extends Args {
  options: string[];
  simple: true;
}

export interface FormSelectSignature {
  Element: HTMLSelectElement;
  Args: ComplexArgs | SimpleArgs;
}

export default class FormSelect extends Component<FormSelectSignature> {
  constructor(owner: unknown, args: FormSelectSignature['Args']) {
    super(owner, args);
    assert(
      '<Form::Select />: Must pass an options array',
      typeOf(this.args.options) === 'array'
    );
    // assert(
    //   '<Form::Select />: Must pass a selected string or undefined',
    //   typeOf(this.args.selected) === 'string' ||
    //     this.args.selected === undefined ||
    //     this.args.selected === null
    // );
    assert(
      '<Form::Select />: Must pass a label string or undefined',
      typeOf(this.args.label) === 'string' || this.args.label === undefined
    );
    assert(
      '<Form::Select />: Must pass an onChange function',
      typeOf(this.args.onChange) === 'function'
    );
  }

  @action
  change({ target }: Event): void {
    const index = parseInt((target as HTMLFormElement)['value']);

    const options = this.args.options as Option[];
    const selected = options[index];

    if (selected) {
      this.args.onChange(selected.value as never);
    } else {
      this.args.onChange(options[0]?.value as never);
    }
  }

  <template>
    <FormLabel
      @text={{@label}}
      @identifier={{@identifier}}
      @required={{@required}}
    />

    {{#if @simple}}
      <select
        id={{@identifier}}
        class='form-select {{if @size (concat "form-select-" @size)}}'
        required={{@required}}
        disabled={{@disabled}}
        {{on 'change' (pick 'target.value' @onChange)}}
        ...attributes
      >
        <option value='' selected={{not @selected}}>
          Choose…
        </option>
        {{#each @options as |opt|}}
          <option selected={{eq @selected opt}}>
            {{opt}}
          </option>
        {{/each}}
      </select>
    {{else}}
      <select
        id={{@identifier}}
        class='form-select {{if @size (concat "form-select-" @size)}}'
        required={{@required}}
        {{on 'change' this.change}}
        ...attributes
      >
        {{#each @options as |opt index|}}
          <option
            value={{if (or opt.value (eq false opt.value)) index ''}}
            selected={{eq @selected opt.value}}
          >
            {{opt.label}}
          </option>
        {{/each}}
      </select>
    {{/if}}

    <FormError @text={{@invalidFeedback}} />
    <FormHelp @text={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Select': typeof FormSelect;
  }
}
