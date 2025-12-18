import { buttonClassName } from '@trusted-american/core';
import { ButtonHTMLAttributes } from 'react';

interface ButtonProps<T> {
  type?: ButtonHTMLAttributes<T>['type'];
  isDisabled?: boolean;
  text: string;
  className?: string;
  onClick?: () => void;
}

const Button = <T,>({
  type = 'button',
  isDisabled,
  text,
  className,
  onClick,
}: ButtonProps<T>) => {
  return (
    <button
      type={type}
      disabled={isDisabled}
      className={`${buttonClassName} ${className}`}
      onClick={onClick}
    >
      {text}
    </button>
  );
};

export default Button;
