import Component from '@glimmer/component';
import fileType, { type Type } from '../utils/file-type';

export interface FileTypeSignature {
  Args: {
    name?: string;
    size?: string;
  };
  Element: HTMLDivElement;
}

export default class FileType extends Component<FileTypeSignature> {
  get fileType(): Type | null {
    const { name } = this.args;
    if (!name || !name.split) {
      return null;
    }
    return fileType(name);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    FileType: typeof FileType;
  }
}
