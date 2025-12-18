import { buttonClassName } from '@trusted-american/core';

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
      className={`${buttonClassName} ${className} `}
      onClick={onClick}
    >
      {text}
    </button>
  );
};

export default Button;
