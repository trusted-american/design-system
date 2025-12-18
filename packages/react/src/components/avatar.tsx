const avatarClassName = 'bg-green-700 text-white p-4 rounded-md';

interface AvatarProps {
  id: string;
}

const Avatar = ({ id }: AvatarProps) => {
  return <div className={avatarClassName}>{id}</div>;
};

export default Avatar;
