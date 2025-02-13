import { helper } from '@ember/component/helper';
import { htmlSafe as _htmlSafe, type SafeString } from '@ember/template';

const htmlSafe = helper(function htmlSafe([value]: [
  string | null,
]): SafeString {
  return _htmlSafe(value!);
});

export default htmlSafe;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'html-safe': typeof htmlSafe;
  }
}
