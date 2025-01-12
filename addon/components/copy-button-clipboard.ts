// TODO: fixes component name conflict
import CopyButton from 'ember-cli-clipboard/components/copy-button';

export default class CopyButtonClipboard extends CopyButton {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CopyButtonClipboard: typeof CopyButtonClipboard;
  }
}
