import { avatarClassName } from '@trusted-american/core';

interface AvatarProps {
  id: string;
}

const Avatar = ({ id }: AvatarProps) => {
  return <div className={avatarClassName}>{id}</div>;
};

export default Avatar;
