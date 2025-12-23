import { buttonBase, buttonVariants, type Color } from '@trusted-american/core';
import { ButtonHTMLAttributes } from 'react';

interface ButtonProps<T> {
  type?: ButtonHTMLAttributes<T>['type'];
  color?: Color;
  isDisabled?: boolean;
  label: string;
  className?: string;
  onClick?: () => void;
}

const Button = <T,>({
  type = 'button',
  color = 'secondary',
  isDisabled,
  label,
  className = '',
  onClick,
}: ButtonProps<T>) => {
  return (
    <button
      type={type}
      disabled={isDisabled}
      className={`${buttonBase} ${buttonVariants[color]} ${className}`}
      onClick={onClick}
    >
      {label}
    </button>
  );
};

export default Button;
