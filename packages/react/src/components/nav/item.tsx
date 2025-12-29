import { navItemBase } from '@trusted-american/core';
import type { ElementType, ReactNode } from 'react';

interface NavItemProps {
  as?: ElementType;
  href: string;
  children: ReactNode;
}

const NavItem = ({ as: Component = 'a', href, children }: NavItemProps) => {
  return (
    <Component href={href} className={navItemBase}>
      {children}
    </Component>
  );
};

export default NavItem;
