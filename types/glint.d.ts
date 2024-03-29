import '@glint/environment-ember-loose';

import type EmberPageTitleRegistry from 'ember-page-title/template-registry';
import type EmberTruthHelpersRegistry from 'ember-truth-helpers/template-registry';

import type { ComponentLike, ModifierLike } from '@glint/template';
import type Breadcrumb from 'ember-breadcrumb-trail/helpers/breadcrumb';
import type Breadcrumbs from 'ember-breadcrumb-trail/helpers/breadcrumbs';
import type CopyButton from 'ember-cli-clipboard/components/copy-button';
import type Call from 'ember-composable-helpers/helpers/call';
import type Dec from 'ember-composable-helpers/helpers/dec';
import type FilterBy from 'ember-composable-helpers/helpers/filter-by';
import type HasNext from 'ember-composable-helpers/helpers/has-next';
import type Inc from 'ember-composable-helpers/helpers/inc';
import type Includes from 'ember-composable-helpers/helpers/includes';
import type Join from 'ember-composable-helpers/helpers/join';
import type Keys from 'ember-composable-helpers/helpers/keys';
import type MapBy from 'ember-composable-helpers/helpers/map-by';
import type Noop from 'ember-composable-helpers/helpers/noop';
import type ObjectAt from 'ember-composable-helpers/helpers/object-at';
import type Optional from 'ember-composable-helpers/helpers/optional';
import type Pick from 'ember-composable-helpers/helpers/pick';
import type Range from 'ember-composable-helpers/helpers/range';
import type Slice from 'ember-composable-helpers/helpers/slice';
import type SortBy from 'ember-composable-helpers/helpers/sort-by';
import type Values from 'ember-composable-helpers/helpers/values';
import type Without from 'ember-composable-helpers/helpers/without';
import type PreventDefault from 'ember-event-helpers/helpers/prevent-default';
import type StopPropagation from 'ember-event-helpers/helpers/stop-propagation';
import type {
  YetiTableHeader,
  YetiTableBody,
  YetiTableFooter,
} from '@trusted-american/design-system/components/table';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry
    extends EmberPageTitleRegistry,
      EmberTruthHelpersRegistry {
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
    breadcrumb: typeof Breadcrumb;
    breadcrumbs: typeof Breadcrumbs;

    // ember-cli-clipboard
    CopyButton: typeof CopyButton;

    // ember-composable-helpers
    call: typeof Call;
    dec: typeof Dec;
    'filter-by': typeof FilterBy;
    'has-next': typeof HasNext;
    inc: typeof Inc;
    includes: typeof Includes;
    join: typeof Join;
    keys: typeof Keys;
    'map-by': typeof MapBy;
    noop: typeof Noop;
    'object-at': typeof ObjectAt;
    optional: typeof Optional;
    pick: typeof Pick;
    range: typeof Range;
    slice: typeof Slice;
    'sort-by': typeof SortBy;
    values: typeof Values;
    without: typeof Without;

    // ember-event-helpers
    'prevent-default': typeof PreventDefault;
    'stop-propagation': typeof StopPropagation;

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
