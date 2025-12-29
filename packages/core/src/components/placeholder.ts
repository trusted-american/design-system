export const placeholderBase = 'flex flex-col items-center gap-4';

export interface Props<T> {
  icon: T;
  title: string;
  subtitle?: string;
}

export interface DefaultProps<T> extends Props<T> {
  buttonLabel?: never;
  secondaryButtonLabel?: never;
  onClick?: never;
  onSecondaryClick?: never;
}

export interface SingleButtonProps<T> extends Props<T> {
  buttonLabel: string;
  secondaryButtonLabel?: never;
  onClick: () => void;
  onSecondaryClick?: never;
}

export interface DoubleButtonProps<T> extends Props<T> {
  buttonLabel: string;
  secondaryButtonLabel: string;
  onClick: () => void;
  onSecondaryClick: () => void;
}
