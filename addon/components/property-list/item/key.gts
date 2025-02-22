import Component from '@glimmer/component';
import Icon from '../../icon';
import tooltip from '../../../modifiers/tooltip';

export interface PropertyListItemKeySignature {
  Args: {
    label: string;
    help?: string;
  };
  Element: HTMLElement;
}

export default class PropertyListItemKey extends Component<PropertyListItemKeySignature> {
  <template>
    <dt class="text-secondary" ...attributes>
      {{@label}}
      {{#if @help}}
        <a href="#" class="text-secondary ms-1">
          <Icon @icon="info-circle" {{tooltip @help}} />
        </a>
      {{/if}}
    </dt>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item::Key': typeof PropertyListItemKey;
  }
}
