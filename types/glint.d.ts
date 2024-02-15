import type EmberTruthHelpersRegistry from 'ember-truth-helpers/template-registry';

import type { ComponentLike, HelperLike, ModifierLike } from '@glint/template';
import type {
  YetiTableHeader,
  YetiTableBody,
  YetiTableFooter,
} from '@trusted-american/design-system/components/table';
import type Ember from 'ember';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends EmberTruthHelpersRegistry {
    // @ember/render-modifiers
    'did-insert': ModifierLike<{
      Args: { Positional: [(element: HTMLElement) => void] };
      Element: HTMLElement;
    }>;

    // @fortawesome/ember-fontawesome
    FaIcon: ComponentLike<{
      Args: {
        icon: string;
        fixedWidth?: boolean;
        size?: string;
        prefix?: string;
        transform?: string;
      };
      Element: HTMLElement;
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
      Args: {
        text: unknown;
        delegateClickEvent?: boolean;
      };
      Blocks: {
        default: [];
      };
      Element: HTMLElement;
    }>;

    // ember-composable-helpers
    dec: HelperLike<{
      Args: {
        Positional: [value: number | Ember.ComputedProperty<number, number>];
      };
      Return: number;
    }>;
    'has-next': HelperLike<{
      Args: { Positional: [unknown, unknown[]] };
      Return: boolean;
    }>;
    inc: HelperLike<{
      Args: { Positional: [value: number] };
      Return: number;
    }>;
    includes: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    noop: HelperLike<{
      Return: () => void;
    }>;
    pick: HelperLike<{
      Args: { Positional: [string, (...args: never[]) => unknown] };
      Return: () => void;
    }>;

    // ember-page-title
    'page-title': HelperLike<{
      Args: { Positional: [title: string] };
      Return: void;
    }>;

    // ember-yeti-table
    YetiTable: ComponentLike<{
      Args: {
        data: unknown[];
        pagination?: boolean;
        sortable?: boolean;
        pageSize?: number;
      };
      Blocks: {
        default: [
          {
            columns: [];
            header: YetiTableHeader;
            body: YetiTableBody<unknown>;
            footer: YetiTableFooter;
            tfoot: ComponentLike<{
              Blocks: {
                default: [
                  {
                    row: ComponentLike<{
                      Blocks: {
                        default: [
                          {
                            cell: ComponentLike<{
                              Args: {
                                visible?: boolean;
                              };
                              Blocks: {
                                default: [];
                              };
                              Element: HTMLElement;
                            }>;
                          },
                        ];
                      };
                      Element: HTMLElement;
                    }>;
                  },
                ];
              };
              Element: HTMLElement;
            }>;
            pagination: ComponentLike<{
              Element: HTMLElement;
            }>;
          },
        ];
      };
      Element: HTMLTableElement;
    }>;
  }
}
