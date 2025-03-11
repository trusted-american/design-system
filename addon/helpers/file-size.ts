import { helper } from '@ember/component/helper';

/**
 * Returns scaled file size from bytes.
 */
const fileSize = helper(function fileSize([bytes]: [number]): string {
  const k = 1024;
  const decimals = 2;
  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

  const i = Math.floor(Math.log(bytes) / Math.log(k));
  const scaled = parseFloat((bytes / Math.pow(k, i)).toFixed(decimals));

  return `${scaled.toString()} ${sizes[i]!}`;
});

export default fileSize;
