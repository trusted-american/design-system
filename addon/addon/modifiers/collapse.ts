import { modifier } from 'ember-modifier';

const collapse = modifier(function collapse(element, positional: [string]) {
  const target = positional[0];

  element.setAttribute('data-bs-toggle', 'collapse');
  element.setAttribute('data-bs-target', `#${target}`);

  return () => {
    element.removeAttribute('data-bs-target');
    element.removeAttribute('data-bs-toggle');
  };
});

export default collapse;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    collapse: typeof collapse;
  }
}
