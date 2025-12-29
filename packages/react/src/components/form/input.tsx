import {
  formInputBase,
  formInputErrorBorder,
  formInputErrorMessage,
} from '@trusted-american/core';
import { forwardRef, type HTMLInputTypeAttribute } from 'react';
import FormHelp from './help';
import FormLabel from './label';

interface FormInputProps {
  type?: HTMLInputTypeAttribute;
  value?: string | number | undefined;
  label: string;
  id: string;
  isRequired?: boolean;
  isDisabled?: boolean;
  placeholder?: string;
  help?: string;
  error?: string;
  pattern?: string;
  readOnly?: boolean;
  className?: string;
  onChange: (value: string) => void;
}

const FormInput = forwardRef<HTMLInputElement, FormInputProps>(
  (
    {
      type = 'text',
      value,
      id,
      label,
      isRequired,
      isDisabled,
      placeholder,
      help,
      error,
      pattern,
      readOnly,
      className = '',
      onChange,
    },
    ref,
  ) => {
    return (
      <div>
        <FormLabel
          label={label}
          id={id}
          isRequired={isRequired}
          requiredLabel="*"
        />
        <div className="w-full flex items-center gap-2">
          <input
            type={type}
            id={id}
            name={id}
            value={value}
            placeholder={placeholder}
            required={isRequired}
            disabled={isDisabled}
            pattern={pattern}
            ref={ref}
            readOnly={readOnly}
            className={`${formInputBase} ${
              error ? formInputErrorBorder : ''
            } ${className}`}
            onChange={({ target }) => {
              onChange(target.value);
            }}
          />
        </div>
        {error && <p className={formInputErrorMessage}>{error}</p>}
        <FormHelp label={help} />
      </div>
    );
  },
);

export default FormInput;
