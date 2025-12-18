import {
  formInputBase,
  formInputErrorBorder,
  formInputErrorMessage,
} from '@trusted-american/core';
import {
  forwardRef,
  type ChangeEvent,
  type HTMLInputTypeAttribute,
} from 'react';
import FormHelp from './help';
import FormLabel from './label';

interface FormInputProps {
  type?: HTMLInputTypeAttribute;
  value?: string | number | undefined;
  id: string;
  label: string;
  isRequired?: boolean;
  isDisabled?: boolean;
  placeholder?: string;
  help?: string;
  error?: string;
  pattern?: string;
  readOnly?: boolean;
  className?: string;
  onChange?: (event: ChangeEvent<HTMLInputElement>) => void;
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
      className,
      onChange,
    },
    ref
  ) => {
    return (
      <div>
        <FormLabel text={label} id={id} isRequired={isRequired} />
        <div className="w-full flex items-center gap-2">
          <input
            type={type}
            id={id}
            name={id}
            value={value}
            placeholder={placeholder}
            onChange={onChange}
            className={`${formInputBase} ${
              error ? formInputErrorBorder : ''
            } ${className}`}
            required={isRequired}
            disabled={isDisabled}
            pattern={pattern}
            ref={ref}
            readOnly={readOnly}
          />
        </div>
        {error && <p className={formInputErrorMessage}>{error}</p>}
        <FormHelp text={help} />
      </div>
    );
  }
);

export default FormInput;
