import Component from '@glimmer/component';
import Icon from './icon';

export interface AlertSignature {
  Args: {
    color?: string;
    icon?: string;
  };
  Blocks: {
    title: [];
    default: [];
  };
  Element: HTMLDivElement;
}

// eslint-disable-next-line ember/no-empty-glimmer-component-classes
export default class Alert extends Component<AlertSignature> {
  <template>
    <div
      class='alert alert-{{if @color @color "secondary"}} d-flex gap-3'
      role='alert'
      ...attributes
    >
      {{#if @icon}}
        <div>
          <Icon @icon={{@icon}} />
        </div>
      {{/if}}
      <div>
        {{#if (has-block 'title')}}
          <h6 class='alert-heading'>{{yield to='title'}}</h6>
        {{/if}}
        {{yield}}
      </div>
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Alert: typeof Alert;
  }
}
