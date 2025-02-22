import Icon from './icon';
import fileType from '../utils/file-type';
import { eq } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';
import type { SizeProp } from '@fortawesome/fontawesome-svg-core';

export interface FileTypeSignature {
  Args: {
    name: string;
    size?: SizeProp;
  };
  Element: HTMLDivElement;
}

const FileType: TOC<FileTypeSignature> = <template>
  <div class="d-inline" data-test-file-type ...attributes>
    {{#if (eq "image" (fileType @name))}}
      <Icon
        @icon="file-image"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-warning"
      />
    {{else if (eq "audio" (fileType @name))}}
      <Icon
        @icon="file-audio"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-warning"
      />
    {{else if (eq "pdf" (fileType @name))}}
      <Icon
        @icon="file-pdf"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-danger"
      />
    {{else if (eq "csv" (fileType @name))}}
      <Icon
        @icon="file-csv"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-success"
      />
    {{else if (eq "zip" (fileType @name))}}
      <Icon
        @icon="file-zipper"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-primary"
      />
    {{else if (eq "word" (fileType @name))}}
      <Icon
        @icon="file-word"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-primary"
      />
    {{else if (eq "excel" (fileType @name))}}
      <Icon
        @icon="file-excel"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-success"
      />
    {{else}}
      <Icon
        @icon="file"
        @size={{@size}}
        @isFixedWidth={{true}}
        class="text-body"
      />
    {{/if}}
  </div>
</template>;

export default FileType;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    FileType: typeof FileType;
  }
}
