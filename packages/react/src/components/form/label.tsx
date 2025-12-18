const formLabelClassName = 'font-semibold text-gray-700';

interface FormLabelProps {
  text: string | undefined;
  id: string;
  isRequired?: boolean;
  className?: string;
}

const FormLabel = ({ text, id, isRequired, className }: FormLabelProps) => {
  return (
    <label className={`${formLabelClassName} ${className ?? ''}`} htmlFor={id}>
      {text}
      {isRequired && <span className="text-red-500"> *</span>}
    </label>
  );
};

export default FormLabel;
