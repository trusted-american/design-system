import { avatarBase } from '@trusted-american/core';

interface AvatarProps {
  id: string;
}

const Avatar = ({ id }: AvatarProps) => {
  return <div className={avatarBase}>{id}</div>;
};

export default Avatar;
