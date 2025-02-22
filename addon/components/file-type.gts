import Component from '@glimmer/component';
import fileType, { type Type } from '../utils/file-type';
import Icon from './icon';

import type { SizeProp } from '@fortawesome/fontawesome-svg-core';

export interface FileTypeSignature {
  Args: {
    name: string;
    size?: SizeProp;
  };
  Element: HTMLDivElement;
}

export default class FileType extends Component<FileTypeSignature> {
  get fileType(): Type | null {
    const { name } = this.args;
    return fileType(name);
  }

  <template>
    <div class="d-inline" data-test-file-type ...attributes>
      {{#if (eq "image" this.fileType)}}
        <Icon
          @icon="file-image"
          @size={{@size}}
          @isFixedWidth={{true}}
          class="text-warning"
        />
      {{else if (eq "audio" this.fileType)}}
        <Icon
          @icon="file-audio"
          @size={{@size}}
          @isFixedWidth={{true}}
          class="text-warning"
        />
      {{else if (eq "pdf" this.fileType)}}
        <Icon
          @icon="file-pdf"
          @size={{@size}}
          @isFixedWidth={{true}}
          class="text-danger"
        />
      {{else if (eq "csv" this.fileType)}}
        <Icon
          @icon="file-csv"
          @size={{@size}}
          @isFixedWidth={{true}}
          class="text-success"
        />
      {{else if (eq "zip" this.fileType)}}
        <Icon
          @icon="file-zipper"
          @size={{@size}}
          @isFixedWidth={{true}}
          class="text-primary"
        />
      {{else if (eq "word" this.fileType)}}
        <Icon
          @icon="file-word"
          @size={{@size}}
          @isFixedWidth={{true}}
          class="text-primary"
        />
      {{else if (eq "excel" this.fileType)}}
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
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    FileType: typeof FileType;
  }
}
