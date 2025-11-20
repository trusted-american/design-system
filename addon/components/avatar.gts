import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import { trustHTML } from '@ember/template';
import { or } from 'ember-truth-helpers';
import Identicon from 'identicon.js';

const DEFAULT_SIZE = 4; // rem

const generateIdenticon = (str: string): string => {
  // encode utf8 as hex
  const hash = str
    .split('')
    .map((char) => char.charCodeAt(0).toString(16))
    .join('');

  const data = new Identicon(hash).toString();
  return `data:image/png;base64,${data}`;
};

export interface AvatarSignature {
  Args: {
    id: string;
    url?: string | null;
    alt: string;
    size?: number;
  };
  Element: HTMLImageElement;
}

const Avatar: TOC<AvatarSignature> = <template>
  <img
    src={{or @url (generateIdenticon @id)}}
    alt={{@alt}}
    class="rounded-circle"
    style={{trustHTML
      (concat
        "object-fit: cover; width: "
        (or @size DEFAULT_SIZE)
        "rem; height: "
        (or @size DEFAULT_SIZE)
        "rem;"
      )
    }}
    data-test-avatar
    ...attributes
  />
</template>;

export default Avatar;
