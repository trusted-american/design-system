import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';
import AsideItem from './item';
import Collapse from '../collapse';
import Nav from '../nav';
import collapse from '../../modifiers/collapse';
import type {
  IconDefinition,
  IconName,
} from '@fortawesome/fontawesome-svg-core';

export interface AsideGroupSignature {
  Args: {
    label: string;
    icon?: IconName | IconDefinition;
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
