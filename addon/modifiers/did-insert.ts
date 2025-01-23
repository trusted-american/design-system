import { modifier } from 'ember-modifier';

interface DidInsertSignature {
  Element: HTMLElement;
  Args: {
    Positional: [(element: HTMLElement) => void];
  };
}

const didInsert = modifier<DidInsertSignature>(function didInsert(
  element,
  [fn],
) {
  fn(element);
});

export default didInsert;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'did-insert': typeof didInsert;
  }
}
