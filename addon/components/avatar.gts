import Component from '@glimmer/component';
import { assert } from '@ember/debug';
import { typeOf } from '@ember/utils';
import { htmlSafe } from '@ember/template';
import Identicon from 'identicon.js';

const DEFAULT_SIZE = 4; // rem

export interface AvatarSignature {
  Element: HTMLImageElement;
  Args: {
    id: string | undefined;
    url?: string | unknown;
    alt: string | undefined;
    size?: number;
  };
}

export default class Avatar extends Component<AvatarSignature> {
  get size() {
    const { size } = this.args;

    assert(
      '<Avatar />: Must pass a size number or undefined',
      typeOf(size) === 'number' || size === undefined
    );

    return size ?? DEFAULT_SIZE;
  }

  get src(): string {
    const { id, url } = this.args;

    assert(
      '<Avatar />: Must pass an id string or a url string',
      typeOf(id) === 'string' || typeOf(url) === 'string'
    );

    if (url) {
      return url as string;
    }

    if (!id) {
      return '';
    }

    // encode utf8 as hex
    const hash = id
      .split('')
      .map((char) => char.charCodeAt(0).toString(16))
      .join('');

    const data = new Identicon(hash).toString();
    return `data:image/png;base64,${data}`;
  }

  get alt(): string {
    const { alt } = this.args;

    assert('<Avatar />: Must pass an alt string', typeOf(alt) === 'string');

    return alt as string;
  }

  get style() {
    return htmlSafe(
      `object-fit: cover; width: ${this.size}rem; height: ${this.size}rem;`
    );
  }

  <template>
    <img
      src={{this.src}}
      alt={{this.alt}}
      class='rounded-circle'
      style={{this.style}}
      data-test-avatar
      ...attributes
    />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Avatar: typeof Avatar;
  }
}