import Component from '@glimmer/component';
import { action } from '@ember/object';
import isValidDate from '../../utils/is-valid-date';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';
import FormInput, { type FormInputArgs } from './input';
import { eq } from 'ember-truth-helpers';

dayjs.extend(utc);

interface Args extends FormInputArgs {
  value: Date | null | undefined;
  type?: 'date' | 'month';
  min?: Date | null;
  max?: Date | null;
  isLocalTimeZone?: boolean;
  onChange: (value: Date | null) => void;
}

export interface FormDateInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormDateInput extends Component<FormDateInputSignature> {
  get value(): string | null {
    if (this.args.value) {
      if (this.args.type === 'month') {
        const djs = dayjs(this.args.value).utc(false);
        return djs.format('YYYY-MM');
      }
      return this.dateToString(this.args.value);
    }
    return '';
  }

  get min(): string | null {
    if (this.args.min) {
      return this.dateToString(this.args.min);
    }
    return '';
  }

  get max(): string | null {
    if (this.args.max) {
      return this.dateToString(this.args.max);
    }
    return '';
  }

  private dateToString(date: Date): string | null {
    if (isValidDate(date)) {
      let djs = dayjs(date);
      if (!this.args.isLocalTimeZone) {
        djs = djs.utc(false);
      }

      const value = djs.format('YYYY-MM-DD');
      return value;
    }
    return null;
  }

  @action
  change(dateStr: string): void {
    if (this.args.isLocalTimeZone) {
      let value: Date | null = dayjs(dateStr).toDate();

      // https://github.com/iamkun/dayjs/issues/1237
      const [yearStr] = dateStr.split('-');
      if (yearStr) {
        value.setFullYear(parseInt(yearStr));
      }

      if (!isValidDate(value)) {
        value = null;
      }

      this.args.onChange(value);
      return;
    }

    let value: Date | null = new Date(dateStr);

    if (isValidDate(value)) {
      if (value.getFullYear() > 9999) {
        value.setFullYear(Math.floor(value.getFullYear() / 10));
      }
    } else {
      value = null;
    }

    this.args.onChange(value);
  }

  <template>
    {{#if (eq "month" @type)}}
      <FormInput
        @type={{if @type @type "date"}}
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
        min={{this.min}}
        max={{this.max}}
        ...attributes
      >
        1st of
      </FormInput>
    {{else}}
      <FormInput
        @type={{if @type @type "date"}}
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
        min={{this.min}}
        max={{this.max}}
        ...attributes
      />
    {{/if}}
  </template>
}
