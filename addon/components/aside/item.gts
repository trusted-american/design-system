import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';

export interface AsideItemSignature {
  Element: HTMLAnchorElement;
  Args: {
    text: string;
    icon: string;
    route: string;
  };
}

export default class AsideItem extends Component<AsideItemSignature> {
  <template>
    <LinkTo @route={{@route}} class='nav-link fw-semibold px-2' ...attributes>
      <FaIcon @icon={{@icon}} @fixedWidth={{true}} class='me-1' />
      <span>{{@text}}</span>
    </LinkTo>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Item': typeof AsideItem;
  }
}
