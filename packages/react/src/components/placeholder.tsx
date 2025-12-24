import { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import {
  DefaultProps,
  DoubleButtonProps,
  placeholderBase,
  SingleButtonProps,
} from '@trusted-american/core';
import Button from './button';
import Icon from './icon';

type PlaceholderProps =
  | DefaultProps<IconDefinition>
  | SingleButtonProps<IconDefinition>
  | DoubleButtonProps<IconDefinition>;

const Placeholder = ({
  icon,
  title,
  subtitle,
  buttonLabel,
  secondaryButtonLabel,
  onClick,
  onSecondaryClick,
}: PlaceholderProps) => {
  return (
    <div className={placeholderBase}>
      <h1>
        <Icon icon={icon} />
      </h1>
      <h4>{title}</h4>
      {subtitle ? <span>{subtitle}</span> : ''}
      {buttonLabel ? (
        <Button label={buttonLabel} color="success" onClick={onClick} />
      ) : (
        ''
      )}
      {secondaryButtonLabel ? (
        <Button label={secondaryButtonLabel} onClick={onSecondaryClick} />
      ) : (
        ''
      )}
    </div>
  );
};

export default Placeholder;
