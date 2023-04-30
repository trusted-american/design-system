import Component from '@glimmer/component';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';

export interface ExternalLinkComponentSignature {
  Element: HTMLAnchorElement;
  Args: {
    url: string;
    text?: string;
    icon?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class ExternalLinkComponent extends Component<ExternalLinkComponentSignature> {
  <template>
    <a
      href={{@url}}
      target='_blank'
      rel='noopener noreferrer'
      data-test-external-link
      ...attributes
    >
      {{#if @icon}}
        <FaIcon @icon={{@icon}} class='me-1' />
      {{/if}}
      {{#if @text}}
        {{@text}}
      {{else}}
        {{yield}}
      {{/if}}
    </a>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ExternalLink: typeof ExternalLinkComponent;
  }
}
