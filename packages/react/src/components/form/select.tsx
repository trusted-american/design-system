import { formSelectBase } from '@trusted-american/core';
import type { ReactNode } from 'react';
import FormHelp from './help';
import FormLabel from './label';

interface FormSelectProps<T extends string> {
  options: T[];
  value: T | undefined;
  id: string;
  label: string;
  isRequired?: boolean;
  disabled?: boolean;
  help?: string;
  className?: string;
  children?: ReactNode;
  onChange: (value: T) => void;
}

const FormSelect = <T extends string>({
  options,
  value,
  id,
  label,
  isRequired,
  disabled,
  help,
  className = '',
  children,
  onChange,
}: FormSelectProps<T>) => {
  return (
    <div>
      <FormLabel
        label={label}
        id={id}
        isRequired={isRequired}
        requiredLabel="*"
      />
      <select
        id={id}
        name={id}
        value={value}
        disabled={disabled}
        required={isRequired}
        className={`${formSelectBase} ${className}`}
        onChange={({ target }) => {
          onChange(target.value as T);
        }}
      >
        {children}
        {options.map((option) => (
          <option key={option} value={option}>
            {option}
          </option>
        ))}
      </select>
      <FormHelp label={help} />
    </div>
  );
};

export default FormSelect;
