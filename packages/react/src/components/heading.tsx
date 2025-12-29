import { headingBase } from '@trusted-american/core';

interface HeadingProps {
  title: string;
  subtitle?: string;
  className?: string;
}

const Heading = ({ title, subtitle, className = '' }: HeadingProps) => {
  return (
    <div className={className}>
      <h1 className={headingBase}>{title}</h1>
      {subtitle ? <p className="mt-1">{subtitle}</p> : ''}
    </div>
  );
};

export default Heading;
