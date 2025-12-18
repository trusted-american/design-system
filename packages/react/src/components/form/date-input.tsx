import { formDateInputBase } from '@trusted-american/core';
import type { ChangeEvent } from 'react';
import FormHelp from './help';
import FormLabel from './label';

interface FormDateInputProps {
  value: string | Date | null;
  id: string;
  label: string;
  isRequired?: boolean;
  disabled?: boolean;
  placeholder?: string;
  help?: string;
  error?: string;
  onChange: (event: ChangeEvent<HTMLInputElement>) => void;
}

const FormDateInput = ({
  value,
  id,
  label,
  isRequired = false,
  disabled = false,
  placeholder,
  help,
  error,
  onChange,
}: FormDateInputProps) => {
  // Simplified format function specifically for datetime-local input
  const formatDateForInput = (dateValue: string | Date | null): string => {
    if (!dateValue) return '';

    // If already in the correct format for datetime-local (YYYY-MM-DDThh:mm)
    if (typeof dateValue === 'string' && dateValue.includes('T')) {
      return dateValue;
    }

    // Convert to Date object and format to local datetime string
    const date = dateValue instanceof Date ? dateValue : new Date(dateValue);
    if (isNaN(date.getTime())) return '';

    // Format to YYYY-MM-DDThh:mm (what datetime-local expects)
    return `${String(date.getFullYear())}-${String(
      date.getMonth() + 1
    ).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}T${String(
      date.getHours()
    ).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}`;
  };

  return (
    <div className="w-full">
      <FormLabel text={label} id={id} isRequired={isRequired} />
      <input
        type="datetime-local"
        id={id}
        name={id}
        value={formatDateForInput(value)}
        placeholder={placeholder}
        onChange={onChange}
        className={`${formDateInputBase} ${
          error ? 'border-2 border-red-500' : ''
        }`}
        required={isRequired}
        disabled={disabled}
      />
      {error && <p className="mt-1 text-sm text-red-600">{error}</p>}
      <FormHelp text={help} />
    </div>
  );
};

export default FormDateInput;
