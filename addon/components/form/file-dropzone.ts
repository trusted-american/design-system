import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';
import { action } from '@ember/object';

import type { UploadFile } from 'ember-file-upload';

export interface FormFileDropzoneSignature {
  Args: {
    accept?: string;
    multiple?: boolean;
    titleLabel: string;
    subtitleLabel: string;
    activeTitleLabel: string;
    onCreate: (file: File) => void;
  };
  Element: HTMLElement;
}

export default class FormFileDropzone extends Component<FormFileDropzoneSignature> {
  id = guidFor(this);

  @action
  create({ file }: UploadFile): void {
    this.args.onCreate(file);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::FileDropzone': typeof FormFileDropzone;
  }
}
