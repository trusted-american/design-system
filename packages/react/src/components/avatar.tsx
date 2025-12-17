interface AvatarProps {
  id: string;
}

const Avatar = ({ id }: AvatarProps) => {
  return <div className="bg-green-700 text-white p-4 rounded-md">{id}</div>;
};

export default Avatar;
