import { guidFor } from '@ember/object/internals';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { faAngleDown } from '@fortawesome/free-solid-svg-icons';
import Component from '@glimmer/component';
import collapse from '../../modifiers/collapse.ts';
import Collapse from '../collapse.gts';
import Nav from '../nav.gts';
import AsideItem from './item.gts';

export interface AsideGroupSignature {
  Args: {
    label: string;
    icon?: IconDefinition;
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
      @route={{@route}}
      @label={{@label}}
      @icon={{@icon}}
      @trailingIcon={{faAngleDown}}
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
