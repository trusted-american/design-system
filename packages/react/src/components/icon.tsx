import { IconDefinition, SizeProp } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { Color, iconVariants } from '@trusted-american/core';

interface IconProps {
  icon: IconDefinition;
  color?: Color;
  size?: SizeProp;
  transform?: string;
  className?: string;
}

const Icon = ({ icon, color, size, transform, className = '' }: IconProps) => {
  return (
    <FontAwesomeIcon
      icon={icon}
      size={size}
      transform={transform}
      className={`${color ? iconVariants[color] : ''} ${className}`}
    />
  );
};

export default Icon;
