import { formLabelBase, formLabelRequired } from '@trusted-american/core';

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
      {isRequired && <span className={formLabelRequired}> *</span>}
    </label>
  );
};

export default FormLabel;
