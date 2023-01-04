import '@glint/environment-ember-loose';
import { ComponentLike, HelperLike, ModifierLike } from '@glint/template';

declare module '@glint/environment-ember-loose/registry' {
  type BsButton = ComponentLike<{
    Element: HTMLButtonElement;
    Args: {
      isSubmit?: true;
      size?: string;
      outline?: boolean;
      color?: string;
      loading?: unknown;
      disabled?: unknown;
      onClick?: () => void;
    };
    Blocks: {
      default: [];
    };
  }>;

  type BsButtonGroup = ComponentLike<{
    Element: HTMLElement;
    Args: {
      isSubmit?: true;
      size?: string;
      outline?: boolean;
      color?: string;
      loading?: unknown;
      disabled?: boolean;
      onClick?: () => void;
    };
    Blocks: {
      default: [
        {
          button: BsButton;
        }
      ];
    };
  }>;

  type BsToolbar = ComponentLike<{
    Element: HTMLDivElement;
    Args: {
      size?: 'sm' | 'lg';
    };
    Blocks: {
      default: [
        {
          group: BsButtonGroup;
        }
      ];
    };
  }>;

  type BsCard = ComponentLike<{
    Element: HTMLDivElement;
    Blocks: {
      default: [
        {
          header: ComponentLike<{
            Element: HTMLElement;
            Args: {
              title?: string;
            };
            Blocks: {
              default: [];
            };
          }>;
          body: ComponentLike<{
            Element: HTMLElement;
            Blocks: {
              default: [];
            };
          }>;
          footer: ComponentLike<{
            Element: HTMLElement;
            Blocks: {
              default: [];
            };
          }>;
        }
      ];
    };
  }>;

  export default interface Registry {
    // @fortawesome/ember-fontawesome

    FaIcon: ComponentLike<{
      Element: HTMLElement;
      Args: {
        icon: string;
        fixedWidth?: boolean;
        size?: string;
        prefix?: string;
        transform?: string;
      };
    }>;

    // ember-breadcrumb-trail

    breadcrumb: HelperLike<{
      Args: {
        Positional: [title: string];
        Named: Record<string, unknown>;
      };
      Return: void;
    }>;
    breadcrumbs: HelperLike<{
      Return: { title: string; data: { route: string; model: string } }[];
    }>;

    // ember-cli-clipboard

    CopyButton: ComponentLike<{
      Element: HTMLElement;
      Args: {
        clipboardText: unknown;
        delegateClickEvent?: boolean;
      };
      Blocks: {
        default: [];
      };
    }>;

    // ember-composable-helpers

    'has-next': HelperLike<{
      Args: { Positional: [unknown, unknown[]] };
      Return: boolean;
    }>;
    or: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: unknown;
    }>;
    pick: HelperLike<{
      Args: { Positional: [string, (...args: never[]) => unknown] };
      Return: () => void;
    }>;

    // ember-math-helpers

    dec: HelperLike<{
      Args: {
        Positional: [value: number | unknown];
      };
      Return: number;
    }>;

    // ember-page-title

    'page-title': HelperLike<{
      Args: { Positional: [title: string] };
      Return: void;
    }>;

    // ember-simple-bootstrap

    'Bs::Accordion': ComponentLike<{
      Blocks: {
        default: [
          {
            item: ComponentLike<{
              Element: HTMLElement;
              Args: {
                show?: boolean;
              };
              Blocks: {
                default: [
                  {
                    button: ComponentLike<{
                      Element: HTMLElement;
                      Blocks: {
                        default: [];
                      };
                    }>;
                    body: ComponentLike<{
                      Element: HTMLElement;
                      Blocks: {
                        default: [];
                      };
                    }>;
                  }
                ];
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::Alert': ComponentLike<{
      Element: HTMLDivElement;
      Args: {
        color?: string;
      };
      Blocks: {
        default: [];
      };
    }>;
    'Bs::Badge': ComponentLike<{
      Element: HTMLElement;
      Args: {
        color?: string;
        pill?: boolean;
      };
      Blocks: {
        default: [];
      };
    }>;
    'Bs::Breadcrumb': ComponentLike<{
      Element: HTMLElement;
      Blocks: {
        default: [
          {
            item: ComponentLike<{
              Args: {
                current?: boolean;
              };
              Blocks: {
                default: [];
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::Button': BsButton;
    'Bs::ButtonGroup': BsButtonGroup;
    'Bs::Card': BsCard;
    'Bs::CloseButton': ComponentLike<{
      Element: HTMLElement;
      Args: {
        white?: boolean | string;
      };
    }>;
    'Bs::Dropdown': ComponentLike<{
      Element: HTMLDivElement;
      Args: {
        align?: string;
      };
      Blocks: {
        default: [
          {
            divider: ComponentLike<{
              Element: HTMLHRElement;
            }>;
            item: ComponentLike<{
              Element: HTMLDivElement;
              Args: {
                label?: string;
                color?: string;
                disabled?: unknown;
                onClick?: () => void;
              };
              Blocks: {
                default: [];
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::ListGroup': ComponentLike<{
      Element: HTMLUListElement;
      Args: {
        flush?: boolean;
      };
      Blocks: {
        default: [
          {
            item: ComponentLike<{
              Element: HTMLElement;
              Blocks: {
                default: [];
              };
            }>;
            'link-to': ComponentLike<{
              Element: HTMLAnchorElement;
              Args: {
                route: string;
                model: unknown;
              };
              Blocks: {
                default: [];
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::ListGroup::Item': ComponentLike<{
      Element: HTMLLIElement;
      Blocks: {
        default: [];
      };
    }>;
    'Bs::Modal': ComponentLike<{
      Element: HTMLElement;
      Args: {
        title: string;
        size?: 'sm' | 'lg' | 'xl';
        scroll?: boolean;
        fullscreen?: boolean;
        static?: boolean;
        keyboard?: boolean;
        hideClose?: unknown;
        onClose: (...args: never[]) => unknown;
      };
      Blocks: {
        default: [
          {
            body: ComponentLike<{
              Element: HTMLElement;
              Blocks: {
                default: [];
              };
            }>;
            footer: ComponentLike<{
              Element: HTMLElement;
              Blocks: {
                default: [];
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::Nav': ComponentLike<{
      Element: HTMLElement;
      Args: {
        tabs?: boolean;
        pills?: boolean;
      };
      Blocks: {
        default: [];
      };
    }>;
    'Bs::Offcanvas': ComponentLike<{
      Element: HTMLElement;
      Args: {
        placement?: string;
        onClose: (...args: never[]) => unknown;
      };
      Blocks: {
        default: [
          {
            header: ComponentLike<{
              Element: HTMLElement;
              Args: {
                title: string;
              };
              Blocks: {
                default: [];
              };
            }>;
            body: ComponentLike<{
              Element: HTMLElement;
              Blocks: {
                default: [];
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::Pagination': ComponentLike<{
      Element: HTMLDivElement;
      Args: {
        curPage: number;
        perPage: number;
        totalItems: number;
        onNext: () => void;
        onPrevious: () => void;
        onSelect: (value: number) => void;
      };
    }>;
    'Bs::Placeholder': ComponentLike<{
      Element: HTMLElement;
    }>;
    'Bs::Progress': ComponentLike<{
      Element: HTMLElement;
      Blocks: {
        default: [
          {
            bar: ComponentLike<{
              Element: HTMLElement;
              Args: {
                value: number;
                color?: string;
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::Spinner': ComponentLike<{
      Element: HTMLElement;
      Args: {
        centered?: boolean;
        large?: boolean;
        color?: string;
      };
    }>;
    'Bs::Toast': ComponentLike<{
      Element: HTMLElement;
      Blocks: {
        default: [
          {
            header: ComponentLike<{
              Blocks: {
                default: [];
              };
            }>;
            body: ComponentLike<{
              Element: HTMLElement;
              Blocks: {
                default: [];
              };
            }>;
          }
        ];
      };
    }>;
    'Bs::Toolbar': BsToolbar;
    dropdown: ModifierLike<{
      Element: HTMLElement;
      Args: { Positional: []; Named: { autoClose?: string } };
    }>;
    tooltip: ModifierLike<{
      Element: HTMLElement;
      Args: {
        Positional: [title: string];
        Named: {
          placement?: string;
          html?: boolean;
        };
      };
    }>;

    // ember-truth-helpers

    and: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    eq: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    gt: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    gte: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    not: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    'not-eq': HelperLike<{
      Args: { Positional: [...values: unknown[]] };
      Return: boolean;
    }>;
  }
}
