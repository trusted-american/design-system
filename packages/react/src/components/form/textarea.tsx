import { formTextareaBase } from '@trusted-american/core';
import FormHelp from './help';
import FormLabel from './label';

interface FormTextareaProps {
  value: string | number | undefined;
  id: string;
  label: string;
  isRequired?: boolean;
  placeholder?: string;
  disabled?: boolean;
  help?: string;
  error?: string;
  className?: string;
  onChange: (value: string) => void;
}

const FormTextarea = ({
  value,
  id,
  label,
  isRequired,
  placeholder,
  disabled,
  help,
  error,
  className,
  onChange,
}: FormTextareaProps) => {
  return (
    <div>
      <FormLabel
        label={label}
        id={id}
        isRequired={isRequired}
        requiredLabel="*"
      />
      <textarea
        id={id}
        name={id}
        value={value}
        placeholder={placeholder}
        disabled={disabled}
        rows={4}
        className={`${formTextareaBase} ${
          error ? 'border-2 border-red-500' : ''
        } ${className}`}
        required={isRequired}
        onChange={({ target }) => {
          onChange(target.value);
        }}
      />
      <FormHelp label={help} />
    </div>
  );
};

export default FormTextarea;
