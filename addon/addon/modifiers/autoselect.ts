import { modifier } from 'ember-modifier';

const autoselect = modifier(function autoselect(element: HTMLInputElement) {
  element.select();
});

export default autoselect;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    autoselect: typeof autoselect;
  }
}
