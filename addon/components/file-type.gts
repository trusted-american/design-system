import Icon from './icon';
import fileType from '../utils/file-type';
import { eq } from 'ember-truth-helpers';
import {
  faFile,
  faFileAudio,
  faFileCsv,
  faFileExcel,
  faFileImage,
  faFilePdf,
  faFileWord,
  faFileZipper,
} from '@fortawesome/free-solid-svg-icons';
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
        @icon={{faFileImage}}
        @color="warning"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "audio" (fileType @name))}}
      <Icon
        @icon={{faFileAudio}}
        @color="warning"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "pdf" (fileType @name))}}
      <Icon
        @icon={{faFilePdf}}
        @color="danger"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "csv" (fileType @name))}}
      <Icon
        @icon={{faFileCsv}}
        @color="success"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "zip" (fileType @name))}}
      <Icon
        @icon={{faFileZipper}}
        @color="primary"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "word" (fileType @name))}}
      <Icon
        @icon={{faFileWord}}
        @color="primary"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else if (eq "excel" (fileType @name))}}
      <Icon
        @icon={{faFileExcel}}
        @color="success"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{else}}
      <Icon
        @icon={{faFile}}
        @color="body"
        @size={{@size}}
        @isFixedWidth={{true}}
      />
    {{/if}}
  </div>
</template>;

export default FileType;
