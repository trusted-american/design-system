import { cardClassName, cardHoverable } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface CardProps {
  isHoverable?: boolean;
  className?: string;
  children: ReactNode;
  onClick?: () => void;
}

const Card = ({
  isHoverable = true,
  className,
  children,
  onClick,
}: CardProps) => {
  return (
    <div
      className={`${cardClassName} ${
        isHoverable ?? cardHoverable
      } ${className}`}
      onClick={onClick}
    >
      {children}
    </div>
  );
};

export default Card;
