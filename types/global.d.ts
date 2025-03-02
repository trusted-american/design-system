import 'ember-source/types';
import 'ember-source/types/preview';
import '@glint/environment-ember-loose';

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
