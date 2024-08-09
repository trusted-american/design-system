import type EmberFileUploadRegistry from 'ember-file-upload/template-registry';
import type EmberPageTitleRegistry from 'ember-page-title/template-registry';
import type EmberTruthHelpersRegistry from 'ember-truth-helpers/template-registry';

import type { ModifierLike } from '@glint/template';
import type FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import type Breadcrumb from 'ember-breadcrumb-trail/helpers/breadcrumb';
import type Breadcrumbs from 'ember-breadcrumb-trail/helpers/breadcrumbs';
import type CopyButton from 'ember-cli-clipboard/components/copy-button';
import type Dec from 'ember-composable-helpers/helpers/dec';
import type HasNext from 'ember-composable-helpers/helpers/has-next';
import type Inc from 'ember-composable-helpers/helpers/inc';
import type Includes from 'ember-composable-helpers/helpers/includes';
import type Pick from 'ember-composable-helpers/helpers/pick';
import type PellEditor from 'ember-pell/components/pell-editor';
import type YetiTable from 'ember-yeti-table/components/yeti-table';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry
    extends EmberFileUploadRegistry,
      EmberPageTitleRegistry,
      EmberTruthHelpersRegistry {
    // @ember/render-modifiers
    'did-insert': ModifierLike<{
      Args: { Positional: [(element: HTMLElement) => void] };
      Element: HTMLElement;
    }>;

    // @fortawesome/ember-fontawesome
    FaIcon: typeof FaIcon;

    // ember-breadcrumb-trail
    breadcrumb: typeof Breadcrumb;
    breadcrumbs: typeof Breadcrumbs;

    // ember-cli-clipboard
    CopyButton: typeof CopyButton;

    // ember-composable-helpers
    dec: typeof Dec;
    'has-next': typeof HasNext;
    inc: typeof Inc;
    includes: typeof Includes;
    pick: typeof Pick;

    // ember-pell
    PellEditor: typeof PellEditor;

    // ember-yeti-table
    YetiTable: typeof YetiTable;
  }
}
