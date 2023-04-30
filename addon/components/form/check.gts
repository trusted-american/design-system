import Component from '@glimmer/component';
import { Input } from '@ember/component';
import FormHelp from './help';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import tooltip from 'ember-simple-bootstrap/modifiers/tooltip';

export interface FormCheckSignature {
  Element: HTMLInputElement;
  Args: {
    value: boolean | null | undefined | unknown;
    label?: string;
    identifier: string;
    inline?: boolean;
    switch?: boolean;
    help?: string;
    helpTooltip?: string;
  };
}

export default class FormCheck extends Component<FormCheckSignature> {
  <template>
    <div
      class='form-check
        {{if @inline "form-check-inline"}}
        {{if @switch "form-switch"}}'
    >
      <Input
        {{! @glint-ignore }}
        @checked={{@value}}
        @type='checkbox'
        id={{@identifier}}
        class='form-check-input'
        ...attributes
      />

      <label class='form-check-label' for={{@identifier}}>
        {{@label}}
      </label>

      {{#if @helpTooltip}}
        <a
          href='#'
          tabindex='-1'
          class='link-secondary'
          {{tooltip @helpTooltip}}
        >
          <FaIcon @icon='circle-info' />
        </a>
      {{/if}}

      <FormHelp @text={{@help}} class='mt-0 mb-2' />
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheck;
  }
}
