import type { TOC } from '@ember/component/template-only';
import { Card } from '@trusted-american/ember';
import getCodeSnippet from 'ember-code-snippet/helpers/get-code-snippet';
import { CodeBlock } from 'ember-shiki';

export interface SnippetSignature {
  Args: {
    name: string;
  };
  Blocks: {
    default: [];
  };
}

const Snippet: TOC<SnippetSignature> = <template>
  <Card class="snippet mb-4" as |card|>
    <card.body class="border-bottom">
      {{yield}}
    </card.body>
    {{#let (getCodeSnippet @name) as |snippet|}}
      <CodeBlock @language={{snippet.language}} @code={{snippet.source}} />
    {{/let}}
  </Card>
</template>;

export default Snippet;
