import Component from '@glimmer/component';

export interface TopHeaderComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class TopHeaderComponent extends Component<TopHeaderComponentSignature> {}

// declare module '@glint/environment-ember-loose/registry' {
//   export default interface Registry {
//     TopHeader: typeof TopHeaderComponent;
//   }
// }
