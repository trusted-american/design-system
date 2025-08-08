import { modifier } from 'ember-modifier';

interface TooltipSignature {
  Element: Element;
  Args: {
    Named: {
      placement?: 'auto' | 'top' | 'bottom' | 'left' | 'right';
      trigger?:
        | 'click'
        | 'hover'
        | 'focus'
        | 'manual'
        | 'click hover'
        | 'click focus'
        | 'hover focus'
        | 'click hover focus';
      html?: boolean;
      onShow?: () => void;
      onHide?: () => void;
    };
    Positional: [string];
  };
}

const tooltip = modifier<TooltipSignature>(
  function tooltip(element, positional, named) {
    const [title] = positional;
    const { onShow, onHide } = named;

    const container = document.createElement('div');
    container.style.position = 'absolute';
    container.style.display = 'inline-block';

    const _tooltip = document.createElement('div');
    _tooltip.textContent = title;
    _tooltip.style.position = 'absolute';
    _tooltip.style.bottom = '125%';
    _tooltip.style.left = '50%';
    _tooltip.style.transform = 'translateX(-50%)';
    _tooltip.style.backgroundColor = 'black';
    _tooltip.style.color = 'white';
    _tooltip.style.padding = '5px 10px';
    _tooltip.style.borderRadius = '5px';
    _tooltip.style.whiteSpace = 'nowrap';
    _tooltip.style.visibility = 'hidden';
    _tooltip.style.opacity = '0';
    _tooltip.style.transition = 'opacity 0.3s';

    element.addEventListener('mouseenter', () => {
      _tooltip.style.visibility = 'visible';
      _tooltip.style.opacity = '1';
    });

    element.addEventListener('mouseleave', () => {
      _tooltip.style.visibility = 'hidden';
      _tooltip.style.opacity = '0';
    });

    container.appendChild(_tooltip);
    element.insertAdjacentElement('afterend', container);

    if (onShow) {
      element.addEventListener('mouseenter', onShow);
    }
    if (onHide) {
      element.addEventListener('mouseleave', onHide);
    }

    // modifier cleanup function called on click, so restore tooltip visibility manually if hovering
    if (element.matches(':hover')) {
      const event = new MouseEvent('mouseenter');
      element.dispatchEvent(event);
    }

    return () => {
      container.remove();

      if (onShow) {
        element.removeEventListener('mouseenter', onShow);
      }
      if (onHide) {
        element.removeEventListener('mouseleave', onHide);
      }
    };
  },
);

export default tooltip;
