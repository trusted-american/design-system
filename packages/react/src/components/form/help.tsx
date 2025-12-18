import { formHelpBase } from '@trusted-american/core';

interface FormHelpProps {
  text: string | undefined;
}

const FormHelp = ({ text }: FormHelpProps) => {
  return <span className={formHelpBase}>{text}</span>;
};

export default FormHelp;
