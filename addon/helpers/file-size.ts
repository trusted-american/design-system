import { helper } from '@ember/component/helper';

const DECIMALS = 2;

/**
 * Returns scaled file size from bytes.
 */
const fileSize = helper(function fileSize([bytes]): string {
  if (!bytes || typeof bytes !== 'number') {
    return bytes as string;
  }

  const k = 1024;
  const dm = DECIMALS < 0 ? 0 : DECIMALS;
  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
});

export default fileSize;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'file-size': typeof fileSize;
  }
}
