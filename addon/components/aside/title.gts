import Component from '@glimmer/component';

export interface AsideTitleSignature {
  Args: {
    label: string;
  };
  Element: HTMLDivElement;
}

export default class AsideTitle extends Component<AsideTitleSignature> {
  <template>
    <div class="text-secondary fw-semibold small mt-3 ps-2 pb-2" ...attributes>
      {{@label}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Title': typeof AsideTitle;
  }
}
