import { helper } from '@ember/component/helper';
import { type SafeString, htmlSafe as _htmlSafe } from '@ember/template';

const htmlSafe = helper(function htmlSafe([value]: [
  string | null,
]): SafeString {
  return _htmlSafe(value!);
});

export default htmlSafe;
