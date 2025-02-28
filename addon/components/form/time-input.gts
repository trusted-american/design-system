import Component from '@glimmer/component';
import { action } from '@ember/object';
import isValidDate from '../../utils/is-valid-date';
import FormInput, { type BaseArgs } from './input';

interface Args extends BaseArgs {
  value: Date | null;
  onChange: (value: Date | null) => void;
}

export interface FormTimeInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormTimeInput extends Component<FormTimeInputSignature> {
  get value(): string {
    const { value } = this.args;

    if (!value || !isValidDate(value)) {
      return '';
    }

    const hours = value.getHours();
    const minutes = value.getMinutes();

    return [
      hours < 10 ? '0' + (hours as unknown as string) : hours,
      minutes < 10 ? '0' + (minutes as unknown as string) : minutes,
    ].join(':');
  }

  @action
  change(v: string): void {
    const value = this.args.value ? new Date(this.args.value) : new Date();
    const [hours, minutes] = v.split(':').map(Number);
    if (hours) value.setHours(hours);
    if (minutes || minutes === 0) value.setMinutes(minutes);

    this.args.onChange(value);
  }

  <template>
    <FormInput
      @type="time"
      @value={{this.value}}
      @label={{@label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
      @help={{@help}}
      @invalidFeedback={{@invalidFeedback}}
      @requiredLabel={{@requiredLabel}}
      @size={{@size}}
      @isInputOnly={{@isInputOnly}}
      @errors={{@errors}}
      @onChange={{this.change}}
      ...attributes
    />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::TimeInput': typeof FormTimeInput;
  }
}
