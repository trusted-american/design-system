import { placeholderBase } from '@trusted-american/core';

interface PlaceholderProps {
  title: string;
  subtitle?: string;
}

const Placeholder = ({ title, subtitle }: PlaceholderProps) => {
  return (
    <div className={placeholderBase}>
      <span>{title}</span>
      <span>{subtitle ? subtitle : ''}</span>
    </div>
  );
};

export default Placeholder;
