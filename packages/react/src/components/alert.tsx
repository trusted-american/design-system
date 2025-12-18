import type { ReactNode } from 'react';

const alertClassName = 'p-4 mb-4 rounded-md border';

const alertVariants = {
  success: 'bg-green-100 text-green-700 border-green-400',
  error: 'bg-red-100 text-red-700 border-red-400',
  warning: 'bg-yellow-100 text-yellow-700 border-yellow-400',
  info: 'bg-blue-100 text-blue-700 border-blue-400',
};

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
