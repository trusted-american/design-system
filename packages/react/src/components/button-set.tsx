import type { ReactNode } from 'react';

interface ButtonSetProps {
  className?: string;
  children: ReactNode;
}

const ButtonSet = ({ className = '', children }: ButtonSetProps) => {
  return <div className={`flex gap-2 ${className}`}>{children}</div>;
};

export default ButtonSet;
