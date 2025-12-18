interface FormHelpProps {
  text: string | undefined;
}

const FormHelp = ({ text }: FormHelpProps) => {
  return <span className="text-sm text-gray-500">{text}</span>;
};

export default FormHelp;
