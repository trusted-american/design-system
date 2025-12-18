import { tableBase, tableWrapper } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface TableProps {
  children: ReactNode;
}

const Table = ({ children }: TableProps) => {
  return (
    <div className={tableWrapper}>
      <table className={tableBase}>{children}</table>
    </div>
  );
};

export default Table;
