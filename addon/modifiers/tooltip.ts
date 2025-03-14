import { modifier } from 'ember-modifier';
import { Tooltip } from 'bootstrap';

interface Options extends Partial<Tooltip.Options> {
  onShow?: () => void;
  onShown?: () => void;
  onHide?: () => void;
  onHidden?: () => void;
}

interface TooltipSignature {
  Element: Element;
  Args: {
    Named: Options;
    Positional: [string];
  };
}

const tooltip = modifier<TooltipSignature>(
  function tooltip(element, positional, named) {
    const [title] = positional;
    const { onShow, onShown, onHide, onHidden, ...options } = named;

    const tooltip = new Tooltip(element, {
      ...options,
      title,
    });

    // fixes tooltip closing when arg updates
    if (element.matches(':hover')) {
      tooltip.show();
    }

    if (onShow) {
      element.addEventListener('show.bs.tooltip', onShow);
    }
    if (onShown) {
      element.addEventListener('shown.bs.tooltip', onShown);
    }
    if (onHide) {
      element.addEventListener('hide.bs.tooltip', onHide);
    }
    if (onHidden) {
      element.addEventListener('hidden.bs.tooltip', onHidden);
    }

    return () => {
      if (onShow) {
        element.removeEventListener('show.bs.tooltip', onShow);
      }
      if (onShown) {
        element.removeEventListener('shown.bs.tooltip', onShown);
      }
      if (onHide) {
        element.removeEventListener('hide.bs.tooltip', onHide);
      }
      if (onHidden) {
        element.removeEventListener('hidden.bs.tooltip', onHidden);
      }

      // TODO: https://github.com/twbs/bootstrap/issues/37474
      tooltip.dispose();
    };
  },
);

export default tooltip;
