interface AvatarProps {
  id: string;
}

const Avatar = ({ id }: AvatarProps) => {
  return <div>{id}</div>;
};

export default Avatar;
