import { type SafeString, htmlSafe as _htmlSafe } from '@ember/template';

export default function htmlSafe(value: string | null): SafeString {
  return _htmlSafe(value!);
}
