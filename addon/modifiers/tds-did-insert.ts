import { modifier } from 'ember-modifier';

const tdsDidInsert = modifier(function tdsDidInsert(
  element: HTMLElement,
  [fn]: [(element: HTMLElement) => void],
) {
  fn(element);
});

export default tdsDidInsert;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'tds-did-insert': typeof tdsDidInsert;
  }
}
