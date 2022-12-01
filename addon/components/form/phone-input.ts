import Component from '@glimmer/component';
import { assert } from '@ember/debug';
import { typeOf } from '@ember/utils';

export interface FormPhoneInputComponentSignature {
  Element: HTMLInputElement;
  Args: {
    value: string | null | undefined;
    label?: string;
    identifier: string;
    required?: boolean;
    onChange: (value: string | null) => void;
  };
}

export default class FormPhoneInputComponent extends Component<FormPhoneInputComponentSignature> {
  get value(): string {
    const value = this.args.value ? this.args.value : '';
    const arr = value
      .replace('+1', '')
      .replace(/\D/g, '')
      .match(/(\d{0,3})(\d{0,3})(\d{0,4})/) as RegExpMatchArray;
    return (
      (!arr[2]
        ? arr[1]
        : '(' + arr[1] + ') ' + arr[2] + (arr[3] ? '-' + arr[3] : '')) ?? ''
    );
  }

  set value(value: string) {
    assert(
      '<Form::PhoneInput />: Must pass an onChange function',
      typeOf(this.args.onChange) === 'function'
    );

    value = value.replace(/\D/g, '');
    if (value) {
      value = '+1' + value;
      this.args.onChange(value);
    } else {
      this.args.onChange(null);
    }
  }
}

// declare module '@glint/environment-ember-loose/registry' {
//   export default interface Registry {
//     'Form::PhoneInput': typeof FormPhoneInputComponent;
//   }
// }
