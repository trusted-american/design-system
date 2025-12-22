import {
  statCardBase,
  statCardLabel,
  statCardValue,
} from '@trusted-american/core';

interface StatCardProps {
  label: string;
  value: string | number | null;
  className?: string;
}

const StatCard = ({ label, value, className }: StatCardProps) => {
  return (
    <div className={`${statCardBase} ${className ?? ''}`}>
      <span className={statCardLabel}>{label}</span>
      <span className={statCardValue}>{value}</span>
    </div>
  );
};

export default StatCard;
