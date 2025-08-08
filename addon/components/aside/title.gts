import type { TOC } from '@ember/component/template-only';

export interface AsideTitleSignature {
  Args: {
    label: string;
  };
  Element: HTMLDivElement;
}

const AsideTitle: TOC<AsideTitleSignature> = <template>
  <div class="text-gray-500 font-semibold text-sm mt-4 ps-2 pb-2" ...attributes>
    {{@label}}
  </div>
</template>;

export default AsideTitle;
