import { placeholderBase } from '@trusted-american/core';

interface PlaceholderProps {
  title: string;
  subtitle?: string;
}

const Placeholder = ({ title, subtitle }: PlaceholderProps) => {
  return (
    <div className={placeholderBase}>
      <span>{title}</span>
      {subtitle ? <span>{subtitle}</span> : ''}
    </div>
  );
};

export default Placeholder;
