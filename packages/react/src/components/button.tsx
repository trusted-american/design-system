interface ButtonProps {
  type?: 'submit';
  disabled?: boolean;
  text: string;
  className?: string;
  onClick?: () => void;
}

const Button = ({ type, disabled, text, className, onClick }: ButtonProps) => {
  return (
    <button
      type={type ?? 'button'}
      disabled={disabled}
      className={`whitespace-nowrap text-white bg-blue-400 cursor-pointer font-medium rounded-lg px-4 py-2 hover:bg-blue-500 focus:ring-4 focus:outline-none focus:ring-blue-300 disabled:bg-blue-300 disabled:cursor-not-allowed ${
        className ?? ''
      } `}
      onClick={onClick}
    >
      {text}
    </button>
  );
};

export default Button;
