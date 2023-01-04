import { helper } from '@ember/component/helper';
import * as dayjs from 'dayjs';
import * as updateLocale from 'dayjs/plugin/updateLocale';
import * as relativeTime from 'dayjs/plugin/relativeTime';

dayjs.extend(updateLocale);
dayjs.extend(relativeTime);

/**
 * Returns time relative to now.
 */
const fromNow = helper(
  ([date]: [unknown], { short }: { short?: boolean }): string => {
    if (!date) {
      return date as string;
    }

    const relativeTime = short
      ? {
          future: 'in %s',
          past: '%s ago',
          s: '1s',
          ss: '%ss',
          m: '1m',
          mm: '%dm',
          h: '1h',
          hh: '%dh',
          d: '1d',
          dd: '%dd',
          M: '1M',
          MM: '%dM',
          y: '1Y',
          yy: '%dY',
        }
      : {
          future: 'in %s',
          past: '%s ago',
          s: 'a few seconds',
          m: 'a minute',
          mm: '%d minutes',
          h: 'an hour',
          hh: '%d hours',
          d: 'a day',
          dd: '%d days',
          M: 'a month',
          MM: '%d months',
          y: 'a year',
          yy: '%d years',
        };

    dayjs.updateLocale('en', {
      relativeTime,
    });

    const djs =
      typeof date === 'number' ? dayjs.unix(date) : dayjs(date as Date);
    return djs.fromNow();
  }
);

export default fromNow;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'from-now': typeof fromNow;
  }
}
