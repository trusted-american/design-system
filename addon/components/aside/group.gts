import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';
import AsideItem from './item';
import Collapse from '../collapse';
import Nav from '../nav';
import collapse from '../../modifiers/collapse';

import type { IconName } from '@fortawesome/fontawesome-svg-core';

export interface AsideGroupSignature {
  Args: {
    label: string;
    icon?: IconName;
    route: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class AsideGroup extends Component<AsideGroupSignature> {
  id = guidFor(this);

  <template>
    <AsideItem
      @label={{@label}}
      @icon={{@icon}}
      @route={{@route}}
      @trailingIcon="angle-down"
      {{collapse this.id}}
      ...attributes
    />
    <Collapse id={{this.id}}>
      <Nav @isPills={{true}} @isVertical={{true}}>
        {{yield}}
      </Nav>
    </Collapse>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Group': typeof AsideGroup;
  }
}
