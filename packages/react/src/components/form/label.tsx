import { formLabelBase } from '@trusted-american/core';

interface FormLabelProps {
  text: string | undefined;
  id: string;
  isRequired?: boolean;
  className?: string;
}

const FormLabel = ({ text, id, isRequired, className }: FormLabelProps) => {
  return (
    <label className={`${formLabelBase} ${className ?? ''}`} htmlFor={id}>
      {text}
      {isRequired && <span className="text-red-500"> *</span>}
    </label>
  );
};

export default FormLabel;
