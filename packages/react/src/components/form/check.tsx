import { formCheckBase } from '@trusted-american/core';
import FormLabel from './label';

interface FormCheckProps {
  value: boolean | undefined;
  label: string;
  id: string;
  isRequired?: boolean;
  className?: string;
  onChange: (value: boolean) => void;
}

const FormCheck = ({
  value,
  id,
  label,
  isRequired,
  className,
  onChange,
}: FormCheckProps) => {
  return (
    <div>
      <input
        type="checkbox"
        id={id}
        name={id}
        checked={value}
        required={isRequired}
        className={`${formCheckBase} ${className}`}
        onChange={({ target }) => {
          onChange(target.checked);
        }}
      />
      <FormLabel label={label} id={id} requiredLabel="*" className="ml-2" />
    </div>
  );
};

export default FormCheck;
