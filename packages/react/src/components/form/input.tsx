import { forwardRef, type ChangeEvent } from 'react';
import FormHelp from './help';
import FormLabel from './label';

const formInputClassName =
  'bg-gray-100 px-3 py-2 rounded-lg focus:outline-blue-400 flex-1';

interface FormInputProps {
  type?: string;
  value?: string | number | undefined;
  id: string;
  label: string;
  isRequired?: boolean;
  disabled?: boolean;
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
      type,
      value,
      id,
      label,
      isRequired,
      disabled,
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
      <div className="w-full">
        <FormLabel text={label} id={id} isRequired={isRequired} />
        <div className="w-full flex items-center gap-2">
          <input
            type={type ?? 'text'}
            id={id}
            name={id}
            value={value}
            placeholder={placeholder}
            onChange={onChange}
            className={`${formInputClassName} ${
              error ? 'border-2 border-red-500' : ''
            } ${className}`}
            required={isRequired}
            disabled={disabled}
            pattern={pattern}
            ref={ref}
            readOnly={readOnly}
          />
        </div>
        {error && <p className="mt-1 text-sm text-red-600">{error}</p>}
        <FormHelp text={help} />
      </div>
    );
  }
);

export default FormInput;
