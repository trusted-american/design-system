import 'ember-source/types';
import 'ember-source/types/preview';
import '@glint/environment-ember-loose';

import type EmberBreadcrumbTrailRegistry from 'ember-breadcrumb-trail/template-registry';
import type EmberComposableHelpersRegistry from '@nullvoxpopuli/ember-composable-helpers/template-registry';
import type EmberFileUploadRegistry from 'ember-file-upload/template-registry';
import type EmberFontAwesomeRegistry from '@fortawesome/ember-fontawesome/template-registry';
import type EmberPageTitleRegistry from 'ember-page-title/template-registry';
import type EmberPowerSelectRegistry from 'ember-power-select/template-registry';
import type EmberShikiRegistry from 'ember-shiki/template-registry';
import type EmberTruthHelpersRegistry from 'ember-truth-helpers/template-registry';

import type CopyButton from 'ember-cli-clipboard/components/copy-button';
import type MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import type GetCodeSnippet from 'ember-code-snippet/helpers/get-code-snippet';
import type PowerSelectWithCreate from 'ember-power-select-with-create/components/power-select-with-create';
import type PowerSelectMultipleWithCreate from 'ember-power-select-with-create/components/power-select-multiple-with-create';
import type YetiTable from 'ember-yeti-table/components/yeti-table';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry
    extends EmberBreadcrumbTrailRegistry,
      EmberComposableHelpersRegistry,
      EmberFileUploadRegistry,
      EmberFontAwesomeRegistry,
      EmberPageTitleRegistry,
      EmberPowerSelectRegistry,
      EmberShikiRegistry,
      EmberTruthHelpersRegistry {
    CopyButton: typeof CopyButton;
    MarkdownToHtml: typeof MarkdownToHtml;
    'get-code-snippet': typeof GetCodeSnippet;
    PowerSelectWithCreate: typeof PowerSelectWithCreate;
    PowerSelectMultipleWithCreate: typeof PowerSelectMultipleWithCreate;
    YetiTable: typeof YetiTable;
  }
}

// TODO: remove

import type Owner from '@ember/owner';

interface TemplateOk {
  result: 'ok';
  moduleName: string;
}

interface TemplateError {
  result: 'error';
  problem: string;
  span: {
    start: number;
    end: number;
  };
}

type Template = TemplateOk | TemplateError;

type TemplateFactory = (owner?: Owner) => Template;
