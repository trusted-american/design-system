import type { ChangeEvent } from 'react';
import FormLabel from './label';

const formCheckClassName =
  'rounded border-gray-300 text-orange-600 focus:ring-orange-500';

interface FormCheckProps {
  value?: boolean | undefined;
  id: string;
  label: string;
  isRequired?: boolean;
  className?: string;
  labelClassName?: string;
  onChange?: (event: ChangeEvent<HTMLInputElement>) => void;
}

const FormCheck = ({
  value,
  id,
  label,
  isRequired,
  className,
  labelClassName,
  onChange,
}: FormCheckProps) => {
  return (
    <div>
      <input
        type="checkbox"
        id={id}
        name={id}
        checked={value}
        onChange={onChange}
        className={`${formCheckClassName} ${className}`}
        required={isRequired}
      />
      <FormLabel
        text={label}
        id={id}
        className={`ml-2 ${labelClassName ?? ''} `}
      />
    </div>
  );
};

export default FormCheck;
