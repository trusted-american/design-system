import dayjs from 'dayjs';
import updateLocale from 'dayjs/plugin/updateLocale';
import relativeTime from 'dayjs/plugin/relativeTime';

dayjs.extend(updateLocale);
dayjs.extend(relativeTime);

/**
 * Returns time relative to now.
 */
export default function fromNow(
  date: Date | number | null | undefined,
  { isCompact }: { isCompact?: boolean } = {},
): string {
  if (!date) {
    return date?.toString() ?? '';
  }

  const relativeTime = isCompact
    ? {
        // TODO: string
        future: 'in %s',
        past: '%s',
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

  const djs = typeof date === 'number' ? dayjs.unix(date) : dayjs(date);
  return djs.fromNow();
}
