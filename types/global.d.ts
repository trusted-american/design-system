import 'ember-source/types';
import 'ember-source/types/preview';
import '@glint/environment-ember-loose';

import type EmberBreadcrumbTrailRegistry from 'ember-breadcrumb-trail/template-registry';
import type EmberComposableHelpersRegistry from '@nullvoxpopuli/ember-composable-helpers/template-registry';
import type EmberFileUploadRegistry from 'ember-file-upload/template-registry';
import type EmberPageTitleRegistry from 'ember-page-title/template-registry';
import type EmberPowerSelectRegistry from 'ember-power-select/template-registry';
import type EmberShikiRegistry from 'ember-shiki/template-registry';
import type EmberTruthHelpersRegistry from 'ember-truth-helpers/template-registry';

import type FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import type CopyButton from 'ember-cli-clipboard/components/copy-button';
import type MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import type GetCodeSnippet from 'ember-code-snippet/helpers/get-code-snippet';
import type PellEditor from 'ember-pell/components/pell-editor';
import type PowerSelectWithCreate from 'ember-power-select-with-create/components/power-select-with-create';
import type PowerSelectMultipleWithCreate from 'ember-power-select-with-create/components/power-select-multiple-with-create';
import type YetiTable from 'ember-yeti-table/components/yeti-table';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry
    extends EmberBreadcrumbTrailRegistry,
      EmberComposableHelpersRegistry,
      EmberFileUploadRegistry,
      EmberPageTitleRegistry,
      EmberPowerSelectRegistry,
      EmberShikiRegistry,
      EmberTruthHelpersRegistry {
    FaIcon: typeof FaIcon;
    CopyButton: typeof CopyButton;
    MarkdownToHtml: typeof MarkdownToHtml;
    'get-code-snippet': typeof GetCodeSnippet;
    PellEditor: typeof PellEditor;
    PowerSelectWithCreate: typeof PowerSelectWithCreate;
    PowerSelectMultipleWithCreate: typeof PowerSelectMultipleWithCreate;
    YetiTable: typeof YetiTable;
  }
}
