import '@glint/environment-ember-loose';

import EmberSimpleBootstrapRegistry from 'ember-simple-bootstrap/template-registry';

import { ComponentLike, HelperLike, ModifierLike } from '@glint/template';
import {
  YetiTableHeader,
  YetiTableBody,
  YetiTableFooter,
} from '@trusted-american/design-system/components/table';
import type PowerSelect from 'ember-power-select/components/power-select';
import type PowerSelectMultiple from 'ember-power-select/components/power-select-multiple';
import type PowerSelectWithCreate from 'ember-power-select-with-create/components/power-select-with-create';
import type PowerSelectMultipleWithCreate from 'ember-power-select-with-create/components/power-select-multiple-with-create';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends EmberSimpleBootstrapRegistry {
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
    'has-next': HelperLike<{
      Args: { Positional: [unknown, unknown[]] };
      Return: boolean;
    }>;
    includes: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    noop: HelperLike<{
      Return: () => void;
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
    inc: HelperLike<{
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

    // ember-power-select

    PowerSelect: typeof PowerSelect;
    PowerSelectMultiple: typeof PowerSelectMultiple;

    // ember-power-select-with-create

    PowerSelectWithCreate: typeof PowerSelectWithCreate;
    PowerSelectMultipleWithCreate: typeof PowerSelectMultipleWithCreate;

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
                          }
                        ];
                      };
                      Element: HTMLElement;
                    }>;
                  }
                ];
              };
              Element: HTMLElement;
            }>;
            pagination: ComponentLike<{
              Element: HTMLElement;
            }>;
          }
        ];
      };
      Element: HTMLTableElement;
    }>;
  }
}
