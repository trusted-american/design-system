import Component from '@glimmer/component';
import fileType, { type Type } from '../utils/file-type';

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
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    FileType: typeof FileType;
  }
}
