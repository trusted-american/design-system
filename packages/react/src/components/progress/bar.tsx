import type { Color } from '@trusted-american/core';

interface ProgressBarProps {
  value: number;
  color?: Color;
  isLabeled?: boolean;
  className?: string;
}

const ProgressBar = ({
  value,
  color = 'primary',
  isLabeled,
  className = '',
}: ProgressBarProps) => {
  return (
    <div
      className={`bg-blue-500 text-xs font-medium text-white text-center p-0.5 leading-none rounded-full h-4 flex items-center justify-center ${className}`}
      style={{ width: `${(value * 100).toString()}%` }}
    >
      {isLabeled ? `${(value * 100).toString()}%` : ''}
    </div>
  );
};

export default ProgressBar;
