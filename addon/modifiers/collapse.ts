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
  element.addEventListener('click', () => {
    const targetElement = document.getElementById(target);
    if (!targetElement) {
      throw new Error();
    }

    if (targetElement.classList.contains('hidden')) {
      targetElement.classList.remove('hidden');
    } else {
      targetElement.classList.add('hidden');
    }
  });
});

export default collapse;
