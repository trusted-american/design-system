import { useEffect, useRef, useState, type ChangeEvent } from 'react';
import FormInput from './input';

interface FormPhoneInputProps {
  value: string;
  id: string;
  label: string;
  isRequired?: boolean;
  placeholder?: string;
  className?: string;
  onChange: (value: string) => void;
}

const FormPhoneInput = ({
  value,
  id,
  label,
  isRequired = false,
  placeholder = '(123) 456-7890',
  className,
  onChange,
}: FormPhoneInputProps) => {
  const [displayValue, setDisplayValue] = useState<string>('');
  const [error, setError] = useState<string>('');
  const inputRef = useRef<HTMLInputElement>(null);

  // Constant for validation message
  const VALIDATION_MESSAGE = 'Please enter a valid 10-digit phone number'; // TODO: string

  // Initialize formatted display value
  useEffect(() => {
    if (value) {
      setDisplayValue(formatPhoneNumber(value));
    }
  }, [value]);

  // Validate against pattern when value changes
  useEffect(() => {
    if (inputRef.current) {
      const cleanValue = value.replace(/\D/g, '');

      if (cleanValue && cleanValue.length === 10) {
        // Valid 10-digit number
        inputRef.current.setCustomValidity('');
      } else if (cleanValue) {
        // Has some digits but not 10
        inputRef.current.setCustomValidity(VALIDATION_MESSAGE);
      } else {
        // Empty or no digits
        inputRef.current.setCustomValidity(
          isRequired ? VALIDATION_MESSAGE : '',
        );
      }
    }
  }, [value, isRequired, VALIDATION_MESSAGE]);

  const formatPhoneNumber = (phone: string): string => {
    // Remove all non-numeric characters
    const cleaned = phone.replace(/\D/g, '').slice(0, 10);

    // Format based on length
    if (cleaned.length === 0) return '';
    if (cleaned.length <= 3) return cleaned;
    if (cleaned.length <= 6)
      return `(${cleaned.slice(0, 3)}) ${cleaned.slice(3)}`;
    return `(${cleaned.slice(0, 3)}) ${cleaned.slice(3, 6)}-${cleaned.slice(
      6,
      10,
    )}`;
  };

  const handleChange = (value: string) => {
    // const input = event.target.value;

    // Format for display
    const formattedInput = formatPhoneNumber(value);
    setDisplayValue(formattedInput);

    // Extract clean value for data
    const cleanValue = value.replace(/\D/g, '').slice(0, 10);

    // Validate
    if (cleanValue.length > 0 && cleanValue.length < 10) {
      setError(VALIDATION_MESSAGE);
      if (inputRef.current) {
        inputRef.current.setCustomValidity(VALIDATION_MESSAGE);
      }
    } else {
      setError('');
      if (inputRef.current) {
        inputRef.current.setCustomValidity('');
      }
    }

    onChange(cleanValue);
  };

  return (
    <FormInput
      type="tel"
      value={displayValue}
      id={id}
      label={label}
      isRequired={isRequired}
      placeholder={placeholder}
      error={error}
      ref={inputRef}
      className={className}
      onChange={handleChange}
    />
  );
};

export default FormPhoneInput;
