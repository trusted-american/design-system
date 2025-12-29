import FormInput from './input';

interface FormDateInputProps {
  value: string | Date | null;
  id: string;
  label: string;
  isRequired?: boolean;
  isDisabled?: boolean;
  placeholder?: string;
  help?: string;
  error?: string;
  onChange: (value: string) => void;
}

const FormDateInput = ({
  value,
  id,
  label,
  isRequired = false,
  isDisabled = false,
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
      date.getMonth() + 1,
    ).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}T${String(
      date.getHours(),
    ).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}`;
  };

  return (
    <FormInput
      type="datetime-local"
      value={formatDateForInput(value)}
      id={id}
      label={label}
      isRequired={isRequired}
      placeholder={placeholder}
      error={error}
      isDisabled={isDisabled}
      help={help}
      onChange={onChange}
    />
  );
};

export default FormDateInput;
