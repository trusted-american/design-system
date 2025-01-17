import { helper } from '@ember/component/helper';

const COUNTRY_CODE = '1';

/**
 * Converts E.164 formatted phone number string to readable format.
 *
 * `+12223334444` -> `+1 (222) 333-4444`
 */
const phoneNumber = helper(
  (
    [value]: [string],
    {
      omitSymbols,
      omitCountryCode,
    }: { omitSymbols?: boolean; omitCountryCode?: boolean },
  ): string => {
    const newValue = value.replace('+1', '').replace(/\D/g, '');

    if (omitSymbols) {
      return newValue;
    }

    const matches = /(\d{0,3})(\d{0,3})(\d{0,4})/.exec(newValue);
    if (!matches) {
      return newValue;
    }

    let result = !matches[2]
      ? matches[1]
      : '(' +
        (matches[1] ?? '') +
        ') ' +
        matches[2] +
        (matches[3] ? '-' + matches[3] : '');

    if (!omitCountryCode) {
      result = `+${COUNTRY_CODE} ` + (result ?? '');
    }

    // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
    return result!;
  },
);

export default phoneNumber;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'phone-number': typeof phoneNumber;
  }
}
