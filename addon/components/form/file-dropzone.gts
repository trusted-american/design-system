import { action } from '@ember/object';
import { guidFor } from '@ember/object/internals';
import { faCloudArrowUp } from '@fortawesome/free-solid-svg-icons';
import Component from '@glimmer/component';
import type { UploadFile } from 'ember-file-upload';
import FileDropzone from 'ember-file-upload/components/file-dropzone';
import fileQueue from 'ember-file-upload/helpers/file-queue';
import Icon from '../icon';

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

  <template>
    {{#let (fileQueue name=this.id onFileAdded=this.create) as |queue|}}
      <FileDropzone
        @queue={{queue}}
        class="form-file-dropzone"
        ...attributes
        as |dropzone|
      >
        {{#if dropzone.active}}
          <h5 class="text-success"><Icon @icon={{faCloudArrowUp}} /></h5>
          <h5 class="text-success">{{@activeTitleLabel}}</h5>
        {{else}}
          <h5><Icon @icon={{faCloudArrowUp}} /></h5>
          <h5>{{@titleLabel}}</h5>
          <label class="text-reset">
            {{@subtitleLabel}}
            <input
              type="file"
              id="files"
              accept={{@accept}}
              multiple={{if @multiple @multiple true}}
              hidden
              data-test-form-file-dropzone
              {{queue.selectFile}}
            />
          </label>
        {{/if}}
      </FileDropzone>
    {{/let}}
  </template>
}
