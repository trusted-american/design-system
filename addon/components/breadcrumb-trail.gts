import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';
import BsBreadcrumb from 'ember-simple-bootstrap/components/bs/breadcrumb';
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import breadcrumbs from 'ember-breadcrumb-trail/helpers/breadcrumbs';
import hasNext from 'ember-composable-helpers/helpers/has-next';

export default class BreadcrumbTrail extends Component {
  <template>
    <BsBreadcrumb as |bc|>
      {{#each (breadcrumbs) as |breadcrumb|}}
        {{#if (hasNext breadcrumb (breadcrumbs))}}
          <bc.item>
            {{#if breadcrumb.data.model}}
              <LinkTo
                @route={{breadcrumb.data.route}}
                @model={{breadcrumb.data.model}}
              >
                {{breadcrumb.title}}
              </LinkTo>
            {{else}}
              <LinkTo @route={{breadcrumb.data.route}}>
                {{breadcrumb.title}}
              </LinkTo>
            {{/if}}
          </bc.item>
        {{else}}
          <bc.item @current={{true}}>
            {{breadcrumb.title}}
          </bc.item>
        {{/if}}
      {{/each}}
    </BsBreadcrumb>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    BreadcrumbTrail: typeof BreadcrumbTrail;
  }
}
