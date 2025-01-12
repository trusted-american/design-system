import Component from '@glimmer/component';

export interface FormPowerSelectMultipleSignature<T> {
  Args: {
    options: T[];
    selected: T[];
    disabled?: boolean;
    placeholder?: string;
    label?: string;
    identifier: string;
    isRequired?: boolean;
    help?: string;
    invalidFeedback?: string;
    renderInPlace?: boolean;
    searchEnabled?: boolean;
    searchField?: string;
    onChange: (selected: T[]) => void;
    onCreate?: (query: string) => void;
  };
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}

export default class FormPowerSelectMultiple<T> extends Component<
  FormPowerSelectMultipleSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::PowerSelectMultiple': typeof FormPowerSelectMultiple;
  }
}
