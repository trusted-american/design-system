import Icon from './icon';

import type { TOC } from '@ember/component/template-only';

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

const Alert: TOC<AlertSignature> = <template>
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
</template>;

export default Alert;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Alert: typeof Alert;
  }
}
