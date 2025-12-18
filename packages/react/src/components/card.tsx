import { cardClassName } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface CardProps {
  hoverable?: boolean;
  className?: string;
  children: ReactNode;
  onClick?: () => void;
}

const Card = ({
  hoverable = true,
  className,
  children,
  onClick,
}: CardProps) => {
  return (
    <div
      className={`${cardClassName} ${
        hoverable ? 'outline-blue-400 hover:outline-2' : ''
      } ${className}`}
      onClick={onClick}
    >
      {children}
    </div>
  );
};

export default Card;
