import { modifier } from 'ember-modifier';

interface CollapseSignature {
  Element: Element;
  Args: {
    Positional: [string];
  };
}

const collapse = modifier<CollapseSignature>(function collapse(
  element,
  [target],
) {
  element.setAttribute('data-bs-toggle', 'collapse');
  element.setAttribute('data-bs-target', `#${target}`);

  return () => {
    element.removeAttribute('data-bs-target');
    element.removeAttribute('data-bs-toggle');
  };
});

export default collapse;
