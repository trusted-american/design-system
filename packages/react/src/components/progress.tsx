import type { ReactNode } from 'react';

interface ProgressProps {
  className?: string;
  children: ReactNode;
}

const Progress = ({ className = '', children }: ProgressProps) => {
  return (
    <div className={`w-full bg-gray-200 rounded-full h-2 ${className}`}>
      {children}
    </div>
  );
};

export default Progress;
