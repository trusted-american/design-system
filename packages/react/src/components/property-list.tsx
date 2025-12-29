import type { ReactNode } from 'react';

interface PropertyListProps {
  className?: string;
  children: ReactNode;
}

const PropertyList = ({ className = '', children }: PropertyListProps) => {
  return <dl className={className}>{children}</dl>;
};

export default PropertyList;
