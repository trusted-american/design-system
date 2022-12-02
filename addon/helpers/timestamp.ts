import { helper } from '@ember/component/helper';
import * as dayjs from 'dayjs';
import * as utc from 'dayjs/plugin/utc';
import * as isToday from 'dayjs/plugin/isToday';
import * as isYesterday from 'dayjs/plugin/isYesterday';

dayjs.extend(utc);
dayjs.extend(isToday);
dayjs.extend(isYesterday);

const DATE_FORMAT = 'MMM D, YYYY';
const TIME_FORMAT = 'h:mm A';

/**
 * Returns formatted date.
 * @param param0
 * @param param1
 * @returns
 */
export const timestamp = (
  [date, format]: [date: unknown, format?: 'date' | 'time'],
  {
    number,
    year,
    utc,
  }: {
    number?: boolean;
    year?: boolean;
    utc?: boolean;
  }
): string => {
  if (!date) {
    return date as string;
  }

  let djs = typeof date === 'number' ? dayjs.unix(date) : dayjs(date as string);

  if (year) {
    return djs.year().toString();
  }

  if (utc) {
    djs = djs.utc(false);
  }

  if (number) {
    return djs.format('MM/DD/YYYY');
  }

  if (format === 'date') {
    return djs.format(DATE_FORMAT);
  } else if (format === 'time') {
    return djs.format(TIME_FORMAT);
  } else {
    if (djs.isToday()) {
      return djs.format(`[Today at] ${TIME_FORMAT}`);
    }

    if (djs.isYesterday()) {
      return djs.format(`[Yesterday at] ${TIME_FORMAT}`);
    }

    return djs.format(`${DATE_FORMAT} [at] ${TIME_FORMAT}`);
  }
};

const _helper = helper(timestamp);

export default _helper;

// declare module '@glint/environment-ember-loose/registry' {
//   export default interface Registry {
//     timestamp: typeof _helper;
//   }
// }
