interface AvatarProps {
  id: string;
}

const Avatar = ({ id }: AvatarProps) => {
  return <div style={{ backgroundColor: 'red', padding: '2rem' }}>{id}</div>;
};

export default Avatar;
