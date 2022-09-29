import Component from '@glimmer/component';
import { assert } from '@ember/debug';
import { typeOf } from '@ember/utils';
import { htmlSafe } from '@ember/template';
import Identicon from 'identicon.js';

const DEFAULT_SIZE = 4; // rem

// export interface AvatarComponentArgs {
//   id: string;
//   url?: string | null;
//   alt: string;
//   size?: number;
// }

export default class AvatarComponent extends Component {
  get size() {
    const { size } = this.args;

    assert(
      '<Avatar />: Must pass a size number or undefined',
      typeOf(size) === 'number' || size === undefined
    );

    return size ?? DEFAULT_SIZE;
  }

  get src() {
    const { id, url } = this.args;

    assert(
      '<Avatar />: Must pass an id string or a url string',
      typeOf(id) === 'string' || typeOf(url) === 'string'
    );

    if (url) {
      return url;
    }

    // encode utf8 as hex
    const hash = id
      .split('')
      .map((char) => char.charCodeAt(0).toString(16))
      .join('');

    const data = new Identicon(hash).toString();
    return `data:image/png;base64,${data}`;
  }

  get alt() {
    const { alt } = this.args;

    assert('<Avatar />: Must pass an alt string', typeOf(alt) === 'string');

    return alt;
  }

  get style() {
    return htmlSafe(
      `object-fit: cover; width: ${this.size}rem; height: ${this.size}rem;`
    );
  }
}
