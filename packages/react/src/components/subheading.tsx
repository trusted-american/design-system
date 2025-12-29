import type { ReactNode } from 'react';

interface SubheadingProps {
  title: string;
  className?: string;
  children: ReactNode;
}

const Subheading = ({ title, className = '', children }: SubheadingProps) => {
  return (
    <div className={`flex justify-between items-start gap-2 mb-6 ${className}`}>
      <h2 className="text-2xl">{title}</h2>
      {children}
    </div>
  );
};

export default Subheading;
