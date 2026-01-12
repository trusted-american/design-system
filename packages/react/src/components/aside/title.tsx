import { asideTitleBase } from '@trusted-american/core';

import React from 'react';

interface AsideTitleProps extends React.HTMLAttributes<HTMLDivElement> {
  label: string;
}

const AsideTitle = ({ label, className, ...props }: AsideTitleProps) => {
  return (
    <div className={asideTitleBase} {...props}>
      {label}
    </div>
  );
};

export default AsideTitle;
