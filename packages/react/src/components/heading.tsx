import { headingBase } from '@trusted-american/core';

interface HeadingProps {
  label: string;
}

const Heading = ({ label }: HeadingProps) => {
  return <h1 className={headingBase}>{label}</h1>;
};

export default Heading;
