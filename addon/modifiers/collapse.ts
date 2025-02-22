import { modifier } from 'ember-modifier';

interface CollapseSignature {
  Element: Element;
  Args: {
    Positional: [string];
  };
}

const collapse = modifier<CollapseSignature>(
  function collapse(element, positional) {
    const target = positional[0];

    element.setAttribute('data-bs-toggle', 'collapse');
    element.setAttribute('data-bs-target', `#${target}`);

    return () => {
      element.removeAttribute('data-bs-target');
      element.removeAttribute('data-bs-toggle');
    };
  },
);

export default collapse;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    collapse: typeof collapse;
  }
}
