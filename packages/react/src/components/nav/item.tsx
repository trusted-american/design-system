import { navItemBase } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface NavItemProps {
  href: string;
  children: ReactNode;
}

const NavItem = ({ children }: NavItemProps) => {
  return <div className={navItemBase}>{children}</div>;
};

export default NavItem;
