import '@glint/environment-ember-loose';
import { ComponentLike, HelperLike } from '@glint/template';
import EmberSimpleBootstrapRegistry from 'ember-simple-bootstrap/template-registry';

declare module '@glint/environment-ember-loose/registry' {
  type YetiTableHeader = ComponentLike<{
    Element: HTMLElement;
    Blocks: {
      default: [
        {
          column: ComponentLike<{
            Element: HTMLElement;
            Args: {
              prop?: string;
              sortable?: boolean;
              sort?: 'asc' | 'desc' | null;
              visible?: unknown;
            };
            Blocks: {
              default: [];
            };
          }>;
        }
      ];
    };
  }>;

  type YetiTableBody<T> = ComponentLike<{
    Element: HTMLElement;
    Blocks: {
      default: [
        {
          row: ComponentLike<{
            Element: HTMLElement;
            Args: {
              prop?: string;
            };
            Blocks: {
              default: [
                {
                  cell: ComponentLike<{
                    Element: HTMLElement;
                    Blocks: {
                      default: [];
                    };
                  }>;
                }
              ];
            };
          }>;
        },
        T
      ];
    };
  }>;

  type YetiTableFooter = ComponentLike<{
    Element: HTMLElement;
    Blocks: {
      default: [];
    };
  }>;

  export default interface Registry extends EmberSimpleBootstrapRegistry {
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
        text: unknown;
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

    // ember-yeti-table

    YetiTable: ComponentLike<{
      Element: HTMLTableElement;
      Args: {
        data: unknown[];
        pagination?: boolean;
        sortable?: boolean;
      };
      Blocks: {
        default: [
          {
            columns: [];
            header: YetiTableHeader;
            body: YetiTableBody<unknown>;
            footer: YetiTableFooter;
            tfoot: ComponentLike<{
              Element: HTMLElement;
              Blocks: {
                default: [
                  {
                    row: ComponentLike<{
                      Element: HTMLElement;
                      Blocks: {
                        default: [
                          {
                            cell: ComponentLike<{
                              Element: HTMLElement;
                              Args: {
                                visible?: boolean;
                              };
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
            pagination: ComponentLike<{
              Element: HTMLElement;
            }>;
          }
        ];
      };
    }>;
  }
}
