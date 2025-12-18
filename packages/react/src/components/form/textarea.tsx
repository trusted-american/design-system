import type { ChangeEvent } from 'react';
import FormHelp from './help';
import FormLabel from './label';

const formTextareaClassName = 'bg-gray-100 px-3 py-2 w-full rounded-lg mt-2';

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
  onChange: (event: ChangeEvent<HTMLTextAreaElement>) => void;
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
    <div className="w-full">
      <FormLabel text={label} id={id} isRequired={isRequired} />
      <textarea
        id={id}
        name={id}
        value={value}
        placeholder={placeholder}
        disabled={disabled}
        onChange={onChange}
        rows={4}
        className={`${formTextareaClassName} ${
          error ? 'border-2 border-red-500' : ''
        } ${className}`}
        required={isRequired}
      />
      <FormHelp text={help} />
    </div>
  );
};

export default FormTextarea;
