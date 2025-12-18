import {
  alertClassName,
  type Color,
  alertVariants,
} from '@trusted-american/core';
import type { ReactNode } from 'react';

interface AlertProps {
  color: Color;
  className?: string;
  children: ReactNode;
}

const Alert = ({ color, className, children }: AlertProps) => {
  return (
    <div className={`${alertClassName} ${alertVariants[color]} ${className}`}>
      {children}
    </div>
  );
};

export default Alert;
