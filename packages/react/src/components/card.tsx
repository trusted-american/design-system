import type { ReactNode } from 'react';

const cardClassName = 'bg-gray-100 rounded-xl overflow-hidden';

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
