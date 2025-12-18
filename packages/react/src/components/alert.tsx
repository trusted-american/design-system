import { alertClassName, alertVariants } from '@trusted-american/core';
import type { ReactNode } from 'react';

export type AlertType = keyof typeof alertVariants;

interface AlertProps {
  type: AlertType;
  className?: string;
  children: ReactNode;
}

const Alert = ({ type = 'info', className, children }: AlertProps) => {
  return (
    <div className={`${alertClassName} ${alertVariants[type]} ${className}`}>
      {children}
    </div>
  );
};

export default Alert;
