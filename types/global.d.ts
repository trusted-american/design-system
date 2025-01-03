import 'ember-source/types';
import 'ember-source/types/preview';
import '@glint/environment-ember-loose';

import type EmberBreadcrumbTrailRegistry from 'ember-breadcrumb-trail/template-registry';
import type EmberComposableHelpersRegistry from '@nullvoxpopuli/ember-composable-helpers/template-registry';
import type EmberFileUploadRegistry from 'ember-file-upload/template-registry';
import type EmberPageTitleRegistry from 'ember-page-title/template-registry';
import type EmberTruthHelpersRegistry from 'ember-truth-helpers/template-registry';

import type { HelperLike, ModifierLike } from '@glint/template';
import type FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import type CopyButton from 'ember-cli-clipboard/components/copy-button';
import type PellEditor from 'ember-pell/components/pell-editor';
import type YetiTable from 'ember-yeti-table/components/yeti-table';
import { CodeBlock } from 'ember-shiki';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry
    extends EmberBreadcrumbTrailRegistry,
      EmberComposableHelpersRegistry,
      EmberFileUploadRegistry,
      EmberPageTitleRegistry,
      EmberTruthHelpersRegistry {
    // @ember/render-modifiers
    'did-insert': ModifierLike<{
      Args: { Positional: [(element: HTMLElement) => void] };
      Element: HTMLElement;
    }>;

    // @fortawesome/ember-fontawesome
    FaIcon: typeof FaIcon;

    // ember-cli-clipboard
    CopyButton: typeof CopyButton;

    // ember-pell
    PellEditor: typeof PellEditor;

    // ember-yeti-table
    YetiTable: typeof YetiTable;

    //Code Snippet
    'get-code-snippet': HelperLike<{
      Args: {
        Positional: [string];
        Named: { unindent?: boolean };
      };
      Return: { language: string; source: unkown };
    }>;
    CodeBlock: typeof CodeBlock;
  }
}
