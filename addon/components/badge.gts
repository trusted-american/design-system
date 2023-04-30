import Component from '@glimmer/component';
import BsBadge from 'ember-simple-bootstrap/components/bs/badge';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';

export interface BadgeSignature {
  Element: HTMLElement;
  Args: {
    text: string;
    color?: string;
    icon?: string;
  };
}

export default class Badge extends Component<BadgeSignature> {
  <template>
    <BsBadge @color={{if @color @color 'secondary'}} ...attributes>
      {{#if @icon}}
        <FaIcon @icon={{@icon}} class='me-1' />
      {{/if}}
      {{@text}}
    </BsBadge>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Badge: typeof Badge;
  }
}
