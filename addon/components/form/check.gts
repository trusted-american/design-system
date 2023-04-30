import Component from '@glimmer/component';
import { Input } from '@ember/component';
import FormHelp from './help';
// @ts-ignore
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import tooltip from 'ember-simple-bootstrap/modifiers/tooltip';

export interface FormCheckComponentSignature {
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

export default class FormCheckComponent extends Component<FormCheckComponentSignature> {
  <template>
    <div
      class="form-check
        {{if @inline 'form-check-inline'}}
        {{if @switch 'form-switch'}}"
    >
      <Input
        {{! @glint-ignore }}
        @checked={{@value}}
        @type="checkbox"
        id={{@identifier}}
        class="form-check-input"
        ...attributes
      />

      <label class="form-check-label" for={{@identifier}}>
        {{@label}}
      </label>

      {{#if @helpTooltip}}
        <a href="#" tabindex="-1" class="link-secondary" {{tooltip @helpTooltip}}>
          <FaIcon @icon="circle-info" />
        </a>
      {{/if}}

      <FormHelp @text={{@help}} class="mt-0 mb-2" />
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheckComponent;
  }
}
