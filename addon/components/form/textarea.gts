import Component from '@glimmer/component';
import { Textarea } from '@ember/component';
import { concat } from '@ember/helper';
import FormLabel from './label';
import FormHelp from './help';

export interface FormTextareaComponentSignature {
  Element: HTMLTextAreaElement;
  Args: {
    value: string | null | undefined;
    size?: 'sm' | 'lg';
    label?: string;
    identifier: string;
    required?: boolean;
    help?: string;
  };
}

export default class FormTextareaComponent extends Component<FormTextareaComponentSignature> {
  <template>
    <FormLabel
      @text={{@label}}
      @identifier={{@identifier}}
      @required={{@required}}
    />

    <Textarea
      @value={{@value}}
      id={{@identifier}}
      required={{@required}}
      class="form-control {{if @size (concat 'form-control-' @size)}}"
      ...attributes
    />

    <FormHelp @text={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Textarea': typeof FormTextareaComponent;
  }
}
