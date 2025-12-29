import {
  avatarBase,
  DEFAULT_SIZE,
  generateIdenticon,
} from '@trusted-american/core';

interface AvatarProps {
  id: string;
  url?: string | null;
  alt: string;
  size?: number;
  className?: string;
}

const Avatar = ({ id, url, alt, size, className = '' }: AvatarProps) => {
  return (
    <img
      src={url ?? generateIdenticon(id)}
      alt={alt}
      className={`${avatarBase} ${className}`}
      style={{
        width: size ?? DEFAULT_SIZE,
        height: size ?? DEFAULT_SIZE,
      }}
    />
  );
};

export default Avatar;
