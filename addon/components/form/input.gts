import Component from '@glimmer/component';
import FormLabel from './label';
import FormError from './error';
import FormHelp from './help';
import { Input } from '@ember/component';
import { concat } from '@ember/helper';
// @ts-ignore
import eq from 'ember-truth-helpers/helpers/eq'

export interface FormInputComponentSignature {
  Element: HTMLInputElement;
  Args: {
    value: string | number | null | undefined | unknown;
    size?: 'sm' | 'lg';
    type?: string;
    label: string;
    identifier: string;
    required?: boolean;
    help?: string;
    invalidFeedback?: string;
    errors?: { message: string }[];
    inputOnly?: boolean;
  };
}

export default class FormInputComponent extends Component<FormInputComponentSignature> {
  <template>
    <FormLabel
      @text={{unless @inputOnly @label}}
      @identifier={{@identifier}}
      @required={{@required}}
    />

    {{! @glint-ignore }}
    <Input
      @value={{@value}}
      @type={{if @type @type "text"}}
      id={{@identifier}}
      class="form-control
        {{if @size (concat 'form-control-' @size)}}
        {{if (eq 'color' @type) 'form-control-color'}}
        {{if (eq 'range' @type) 'form-range'}}
        {{if @errors 'is-invalid'}}"
      required={{@required}}
      aria-label={{if @inputOnly @label}}
      ...attributes
    />

    <FormError @text={{@invalidFeedback}} />

    {{#each @errors as |error|}}
      <div class="invalid-feedback">
        {{error.message}}
      </div>
    {{/each}}

    <FormHelp @text={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Input': typeof FormInputComponent;
  }
}
