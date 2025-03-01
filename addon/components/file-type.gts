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
        @color="warning"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "audio" (fileType @name))}}
      <Icon
        @icon="file-audio"
        @color="warning"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "pdf" (fileType @name))}}
      <Icon
        @icon="file-pdf"
        @color="danger"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "csv" (fileType @name))}}
      <Icon
        @icon="file-csv"
        @color="success"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "zip" (fileType @name))}}
      <Icon
        @icon="file-zipper"
        @color="primary"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "word" (fileType @name))}}
      <Icon
        @icon="file-word"
        @color="primary"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "excel" (fileType @name))}}
      <Icon
        @icon="file-excel"
        @color="success"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else}}
      <Icon @icon="file" @color="body" @size={{@size}} @isFixedWidth={{true}} />
    {{/if}}
  </div>
</template>;

export default FileType;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    FileType: typeof FileType;
  }
}
