import { buttonBase, buttonVariants, type Color } from '@trusted-american/core';
import { ButtonHTMLAttributes } from 'react';
import Spinner from './spinner';

interface ButtonProps<T> {
  type?: ButtonHTMLAttributes<T>['type'];
  label: string;
  color?: Color;
  isLoading?: boolean;
  isDisabled?: boolean;
  className?: string;
  onClick?: () => void;
}

const Button = <T,>({
  type = 'button',
  label,
  color = 'primary',
  isLoading,
  isDisabled,
  className = '',
  onClick,
}: ButtonProps<T>) => {
  return (
    <button
      type={type}
      disabled={isLoading || isDisabled}
      className={`${buttonBase} ${buttonVariants[color]} ${className}`}
      onClick={onClick}
    >
      {isLoading ? <Spinner loadingLabel="Loading…" /> : label}
    </button>
  );
};

export default Button;
