import { avatarBase } from '@trusted-american/core';
import Identicon from 'identicon.js';

const DEFAULT_SIZE = 4; // rem

// TODO: duplicated
const generateIdenticon = (str: string): string => {
  // encode utf8 as hex
  const hash = str
    .split('')
    .map((char) => char.charCodeAt(0).toString(16))
    .join('');

  const data = new Identicon(hash).toString();
  return `data:image/png;base64,${data}`;
};

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
