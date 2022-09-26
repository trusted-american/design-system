import { helper } from '@ember/component/helper';

const DECIMALS = 2;

/**
 * Returns scaled file size from bytes.
 */
export default helper(function fileSize([bytes]) {
  if (!bytes || typeof bytes !== 'number') {
    return bytes;
  }

  const k = 1024;
  const dm = DECIMALS < 0 ? 0 : DECIMALS;
  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
});
