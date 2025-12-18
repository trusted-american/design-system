import { formSelectBase } from '@trusted-american/core';
import type { ChangeEvent, ReactNode } from 'react';
import FormHelp from './help';
import FormLabel from './label';

interface FormSelectProps {
  options: string[];
  value: string | undefined;
  id: string;
  label: string;
  isRequired?: boolean;
  disabled?: boolean;
  help?: string;
  className?: string;
  children?: ReactNode;
  onChange?: (event: ChangeEvent<HTMLSelectElement>) => void;
}

const FormSelect = ({
  options,
  value,
  id,
  label,
  isRequired,
  disabled,
  help,
  className,
  children,
  onChange,
}: FormSelectProps) => {
  return (
    <div className="w-full">
      <FormLabel text={label} id={id} isRequired={isRequired} />
      <select
        id={id}
        name={id}
        value={value}
        disabled={disabled}
        onChange={onChange}
        className={`${formSelectBase} ${className}`}
        required={isRequired}
      >
        {children}
        {options.map((option) => (
          <option key={option} value={option}>
            {option}
          </option>
        ))}
      </select>
      <FormHelp text={help} />
    </div>
  );
};

export default FormSelect;
