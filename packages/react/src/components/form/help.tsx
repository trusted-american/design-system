const formHelpClassName = 'text-sm text-gray-500';

interface FormHelpProps {
  text: string | undefined;
}

const FormHelp = ({ text }: FormHelpProps) => {
  return <span className={formHelpClassName}>{text}</span>;
};

export default FormHelp;
