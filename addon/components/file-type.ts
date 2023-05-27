import Component from '@glimmer/component';
import fileType, { type Type } from '../utils/file-type';

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
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    FileType: typeof FileType;
  }
}
