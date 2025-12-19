import { formHelpBase } from '@trusted-american/core';

interface FormHelpProps {
  label: string | undefined;
  className?: string;
}

const FormHelp = ({ label, className }: FormHelpProps) => {
  return <span className={`${formHelpBase} ${className}`}>{label}</span>;
};

export default FormHelp;
