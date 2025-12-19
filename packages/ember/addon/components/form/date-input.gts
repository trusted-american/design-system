import Component from '@glimmer/component';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';
import { eq } from 'ember-truth-helpers';
import isValidDate from '../../utils/is-valid-date';
import FormInput, { type FormInputArgs } from './input';

dayjs.extend(utc);

const dateToString = (
  date: Date,
  isLocalTimeZone: boolean | undefined,
): string | null => {
  if (isValidDate(date)) {
    let djs = dayjs(date);
    if (!isLocalTimeZone) {
      djs = djs.utc(false);
    }

    const value = djs.format('YYYY-MM-DD');
    return value;
  }
  return null;
};

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
      return dateToString(this.args.value, this.args.isLocalTimeZone);
    }
    return '';
  }

  get min(): string | null {
    if (this.args.min) {
      return dateToString(this.args.min, this.args.isLocalTimeZone);
    }
    return '';
  }

  get max(): string | null {
    if (this.args.max) {
      return dateToString(this.args.max, this.args.isLocalTimeZone);
    }
    return '';
  }

  change = (dateStr: string) => {
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
  };

  <template>
    {{#if (eq "month" @type)}}
      <FormInput
        @type={{if @type @type "date"}}
        @value={{this.value}}
        @label={{@label}}
        @id={{@id}}
        @isRequired={{@isRequired}}
        @help={{@help}}
        @invalidLabel={{@invalidLabel}}
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
        @id={{@id}}
        @isRequired={{@isRequired}}
        @help={{@help}}
        @invalidLabel={{@invalidLabel}}
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
