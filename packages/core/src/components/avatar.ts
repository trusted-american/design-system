import Identicon from 'identicon.js';

export const avatarBase = 'object-cover rounded-full';

export const DEFAULT_SIZE = 4; // rem

export const generateIdenticon = (str: string): string => {
  // encode utf8 as hex
  const hash = str
    .split('')
    .map((char) => char.charCodeAt(0).toString(16))
    .join('');

  const data = new Identicon(hash).toString();
  return `data:image/png;base64,${data}`;
};
