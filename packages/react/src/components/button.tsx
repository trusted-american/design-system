import {
  buttonClassName,
  buttonVariants,
  type Color,
} from '@trusted-american/core';
import { ButtonHTMLAttributes } from 'react';

interface ButtonProps<T> {
  type?: ButtonHTMLAttributes<T>['type'];
  color?: Color;
  isDisabled?: boolean;
  text: string;
  className?: string;
  onClick?: () => void;
}

const Button = <T,>({
  type = 'button',
  color = 'secondary',
  isDisabled,
  text,
  className,
  onClick,
}: ButtonProps<T>) => {
  return (
    <button
      type={type}
      disabled={isDisabled}
      className={`${buttonClassName} ${buttonVariants[color]} ${className}`}
      onClick={onClick}
    >
      {text}
    </button>
  );
};

export default Button;
