import Helper from '@ember/component/helper';

export default class GetCodeSnippet extends Helper<{
  Args: {
    Positional: [string];
    Named: { unindent?: boolean };
  };
  Return: { language: string; source: unkown };
}> {}
