import { navBase } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface NavProps {
  children: ReactNode;
}

const Nav = ({ children }: NavProps) => {
  return <div className={navBase}>{children}</div>;
};

export default Nav;
