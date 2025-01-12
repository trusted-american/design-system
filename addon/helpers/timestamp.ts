import { helper } from '@ember/component/helper';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';
import isYesterday from 'dayjs/plugin/isYesterday';
import isToday from 'dayjs/plugin/isToday';
import isTomorrow from 'dayjs/plugin/isTomorrow';

dayjs.extend(utc);
dayjs.extend(isYesterday);
dayjs.extend(isToday);
dayjs.extend(isTomorrow);

const DATE_FORMAT = 'MMM D, YYYY';
const TIME_FORMAT = 'h:mm A';
const YEAR_FORMAT = 'YYYY';

interface Options {
  utc?: boolean;
  format?: 'date' | 'time' | 'numberDate' | 'year' | 'full';
}

/**
 * Returns formatted date.
 * @param param0
 * @param param1
 * @returns
 */
export const timestamp = (
  [date]: [Date | string | number | null | undefined],
  opts: Options,
): string => {
  const { format, utc } = opts;

  if (!date) {
    return date as string;
  }

  let djs = typeof date === 'number' ? dayjs.unix(date) : dayjs(date);

  if (utc) {
    djs = djs.utc(false);
  }

  if (format === 'date') {
    return djs.format(DATE_FORMAT);
  } else if (format === 'time') {
    return djs.format(TIME_FORMAT);
  } else if (format === 'numberDate') {
    return djs.format('MM/DD/YYYY');
  } else if (format === 'year') {
    return djs.format(YEAR_FORMAT);
  } else if (format !== 'full') {
    if (djs.isYesterday()) {
      return djs.format(`[Yesterday at] ${TIME_FORMAT}`);
    }
    if (djs.isToday()) {
      return djs.format(`[Today at] ${TIME_FORMAT}`);
    }
    if (djs.isTomorrow()) {
      return djs.format(`[Tomorrow at] ${TIME_FORMAT}`);
    }
  }
  return djs.format(`${DATE_FORMAT} [at] ${TIME_FORMAT}`);
};

const _helper = helper(timestamp);

export default _helper;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    timestamp: typeof _helper;
  }
}
