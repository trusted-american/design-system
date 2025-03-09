import { Card } from '@trusted-american/design-system';
import { CodeBlock } from 'ember-shiki';
import getCodeSnippet from 'ember-code-snippet/helpers/get-code-snippet';

import type { TOC } from '@ember/component/template-only';

export interface SnippetSignature {
  Args: {
    name: string;
  };
  Blocks: {
    default: [];
  };
}

const Snippet: TOC<SnippetSignature> = <template>
  <Card class="mb-4" as |card|>
    <card.body class="border-bottom">
      {{yield}}
    </card.body>
    {{#let (getCodeSnippet @name) as |snippet|}}
      <CodeBlock @language={{snippet.language}} @code={{snippet.source}} />
    {{/let}}
  </Card>
</template>;

export default Snippet;
