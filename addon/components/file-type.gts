import Component from '@glimmer/component';
import fileType, { type Type } from '../utils/file-type';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
// @ts-ignore
import eq from 'ember-truth-helpers/helpers/eq';

export interface FileTypeSignature {
  Element: HTMLDivElement;
  Args: {
    name?: string;
    size?: string;
  };
}

export default class FileType extends Component<FileTypeSignature> {
  get fileType(): Type | null {
    const { name } = this.args;
    if (!name || !name.split) {
      return null;
    }
    const parts = name.split('.');
    const extension = parts[parts.length - 1];
    if (!extension) {
      return null;
    }

    return fileType(extension);
  }

  <template>
    <div class='d-inline' data-test-file-type ...attributes>
      {{#if (eq 'image' this.fileType)}}
        <FaIcon @icon='file-image' @size={{@size}} class='text-warning' />
      {{else if (eq 'pdf' this.fileType)}}
        <FaIcon @icon='file-pdf' @size={{@size}} class='text-danger' />
      {{else if (eq 'word' this.fileType)}}
        <FaIcon @icon='file-word' @size={{@size}} class='text-primary' />
      {{else if (eq 'excel' this.fileType)}}
        <FaIcon @icon='file-excel' @size={{@size}} class='text-success' />
      {{else}}
        <FaIcon @icon='file' @size={{@size}} class='text-body' />
      {{/if}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    FileType: typeof FileType;
  }
}
