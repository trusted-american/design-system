import type { TOC } from '@ember/component/template-only';

export interface AsideTitleSignature {
  Args: {
    label: string;
  };
  Element: HTMLDivElement;
}

const AsideTitle: TOC<AsideTitleSignature> = <template>
  <div class="text-secondary fw-semibold small mt-3 ps-2 pb-2" ...attributes>
    {{@label}}
  </div>
</template>;

export default AsideTitle;
