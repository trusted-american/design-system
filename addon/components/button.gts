import Component from '@glimmer/component';
import BsButton from 'ember-simple-bootstrap/components/bs/button';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
// @ts-ignore
import and from 'ember-truth-helpers/helpers/and';
// @ts-ignore
import not from 'ember-truth-helpers/helpers/not';

export interface ButtonSignature {
  Element: HTMLButtonElement;
  Args: {
    isSubmit?: true;
    text: string;
    icon?: string;
    iconTrailing?: boolean;
    iconOnly?: boolean;
    size?: 'sm' | 'lg';
    outline?: boolean;
    color?: string;
    loading?: unknown;
  };
}

export default class Button extends Component<ButtonSignature> {
  <template>
    <BsButton
      @isSubmit={{@isSubmit}}
      @size={{@size}}
      @outline={{@outline}}
      @color={{if @color @color 'secondary'}}
      disabled={{if @loading true}}
      aria-label={{if @iconOnly @text}}
      ...attributes
    >
      {{#if @loading}}
        <span class='spinner-border spinner-border-sm' role='status'></span>
      {{/if}}
      {{if (and (not @iconOnly) @iconTrailing) @text}}
      {{#if @icon}}
        <FaIcon
          @icon={{@icon}}
          class={{unless @iconOnly (if @iconTrailing 'ms-1' 'me-1')}}
        />
      {{/if}}
      {{if (and (not @iconOnly) (not @iconTrailing)) @text}}
    </BsButton>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
