import { formHelpClassName } from '@trusted-american/core';

interface FormHelpProps {
  text: string | undefined;
}

const FormHelp = ({ text }: FormHelpProps) => {
  return <span className={formHelpClassName}>{text}</span>;
};

export default FormHelp;
