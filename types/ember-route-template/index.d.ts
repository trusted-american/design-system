import type { TemplateOnlyComponent } from '@ember/component/template-only';
export default function RouteTemplate<S>(
  Component: TemplateOnlyComponent<S>,
): TemplateFactory;
export default function RouteTemplate(Component: object): TemplateFactory;

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

export type TemplateFactory = (owner?: Owner) => Template;
