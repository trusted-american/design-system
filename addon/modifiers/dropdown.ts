import { modifier } from 'ember-modifier';

interface DropdownSignature {
  Element: Element;
  Args: {
    Named: {
      autoClose?: 'outside';
      onShow?: () => void;
      onHide?: () => void;
    };
  };
}

const dropdown = modifier<DropdownSignature>(function dropdown(
  element,
  _positional,
  { onShow, onHide },
) {
  let isOpen = false;

  element.addEventListener('click', () => {
    const target = element.nextElementSibling;
    if (!target) {
      throw new Error();
    }

    if (isOpen) {
      isOpen = false;
      target.classList.remove('block');
      target.classList.add('hidden');
      if (onHide) {
        onHide();
      }
    } else {
      isOpen = true;
      target.classList.add('block');
      target.classList.remove('hidden');
      if (onShow) {
        onShow();
      }
    }
  });
});

export default dropdown;
