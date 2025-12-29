import { type Color, bannerBase, bannerVariants } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface BannerProps {
  color?: Color;
  className?: string;
  children: ReactNode;
}

const Banner = ({
  color = 'primary',
  className,
  children = '',
}: BannerProps) => {
  return (
    <section className={`${bannerBase} ${bannerVariants[color]} ${className}`}>
      {children}
    </section>
  );
};

export default Banner;
