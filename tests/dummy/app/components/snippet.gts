import type { TOC } from '@ember/component/template-only';
import { Card } from '@trusted-american/design-system';
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
  <Card class="mb-6" as |card|>
    <card.body class="border-b">
      {{yield}}
    </card.body>
    {{#let (getCodeSnippet @name) as |snippet|}}
      <CodeBlock @language={{snippet.language}} @code={{snippet.source}} />
    {{/let}}
  </Card>
</template>;

export default Snippet;
