import { type Color, badgeBase, badgeVariants } from '@trusted-american/core';

interface BadgeProps {
  label?: string;
  color?: Color;
  className?: string;
}

const Badge = ({ label, color = 'secondary', className = '' }: BadgeProps) => {
  return (
    <span className={`${badgeBase} ${badgeVariants[color]} ${className}`}>
      {label}
    </span>
  );
};

export default Badge;
