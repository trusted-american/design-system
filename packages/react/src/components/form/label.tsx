import { formLabelBase } from '@trusted-american/core';
import Badge from '../badge';

interface FormLabelProps {
  label: string | undefined;
  id: string;
  isRequired?: boolean;
  requiredLabel: string;
  className?: string;
}

const FormLabel = ({
  label,
  id,
  isRequired,
  requiredLabel,
  className,
}: FormLabelProps) => {
  return (
    <label htmlFor={id} className={`${formLabelBase} ${className}`}>
      {label}
      {isRequired && <Badge label={requiredLabel} className="ms-1" />}
    </label>
  );
};

export default FormLabel;
