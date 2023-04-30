import Component from '@glimmer/component';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import BsAlert from 'ember-simple-bootstrap/components/bs/alert';

export interface AlertComponentSignature {
  Element: HTMLDivElement;
  Args: {
    color?: string;
    icon?: string;
  };
  Blocks: {
    title: [];
    body: [];
  };
}

export default class AlertComponent extends Component<AlertComponentSignature> {
  <template>
    <BsAlert
      @color={{if @color @color 'secondary'}}
      class='d-flex gap-3'
      ...attributes
    >
      {{#if @icon}}
        <div>
          <FaIcon @icon={{@icon}} />
        </div>
      {{/if}}
      <div>
        {{#if (has-block 'title')}}
          <h6 class='alert-heading'>{{yield to='title'}}</h6>
        {{/if}}
        {{yield to='body'}}
      </div>
    </BsAlert>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Alert: typeof AlertComponent;
  }
}
