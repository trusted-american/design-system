interface PropertyListItemProps {
  key: string;
  value: string;
}

const PropertyListItem = ({ key, value }: PropertyListItemProps) => {
  return (
    <>
      <dt>{key}</dt>
      <dd>{value}</dd>
    </>
  );
};

export default PropertyListItem;
