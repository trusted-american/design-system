import { modifier } from 'ember-modifier';
import { Dropdown } from 'bootstrap';

interface Options extends Partial<Dropdown.Options> {
  onShow?: () => void;
  onShown?: () => void;
  onHide?: () => void;
  onHidden?: () => void;
}

interface CollapseSignature {
  Element: Element;
  Args: {
    Named: Options;
  };
}

const dropdown = modifier<CollapseSignature>(function dropdown(
  element,
  _positional,
  { onShow, onShown, onHide, onHidden, ...options },
) {
  element.classList.add('dropdown-toggle');
  element.setAttribute('data-bs-toggle', 'dropdown');

  const dropdown = new Dropdown(element, options);

  if (onShow) {
    element.addEventListener('show.bs.dropdown', onShow);
  }
  if (onShown) {
    element.addEventListener('shown.bs.dropdown', onShown);
  }
  if (onHide) {
    element.addEventListener('hide.bs.dropdown', onHide);
  }
  if (onHidden) {
    element.addEventListener('hidden.bs.dropdown', onHidden);
  }

  return () => {
    if (onShow) {
      element.removeEventListener('show.bs.dropdown', onShow);
    }
    if (onShown) {
      element.removeEventListener('shown.bs.dropdown', onShown);
    }
    if (onHide) {
      element.removeEventListener('hide.bs.dropdown', onHide);
    }
    if (onHidden) {
      element.removeEventListener('hidden.bs.dropdown', onHidden);
    }

    dropdown.dispose();

    element.removeAttribute('data-bs-toggle');
    element.classList.remove('dropdown-toggle');
  };
});

export default dropdown;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    dropdown: typeof dropdown;
  }
}
