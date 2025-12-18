import type { ChangeEvent, ReactNode } from 'react';
import FormHelp from './help';
import FormLabel from './label';

const formSelectClassName = 'bg-gray-100 px-3 py-2 w-full rounded-lg';

interface FormSelectProps {
  value: string | undefined;
  id: string;
  label: string;
  isRequired?: boolean;
  disabled?: boolean;
  help?: string;
  isStateSelect?: boolean;
  className?: string;
  children?: ReactNode;
  onChange?: (event: ChangeEvent<HTMLSelectElement>) => void;
}

const states = [
  'Alabama',
  'Alaska',
  'Arizona',
  'Arkansas',
  'California',
  'Colorado',
  'Connecticut',
  'Delaware',
  'Florida',
  'Georgia',
  'Hawaii',
  'Idaho',
  'Illinois',
  'Indiana',
  'Iowa',
  'Kansas',
  'Kentucky',
  'Louisiana',
  'Maine',
  'Maryland',
  'Massachusetts',
  'Michigan',
  'Minnesota',
  'Mississippi',
  'Missouri',
  'Montana',
  'Nebraska',
  'Nevada',
  'New Hampshire',
  'New Jersey',
  'New Mexico',
  'New York',
  'North Carolina',
  'North Dakota',
  'Ohio',
  'Oklahoma',
  'Oregon',
  'Pennsylvania',
  'Rhode Island',
  'South Carolina',
  'South Dakota',
  'Tennessee',
  'Texas',
  'Utah',
  'Vermont',
  'Virginia',
  'Washington',
  'West Virginia',
  'Wisconsin',
  'Wyoming',
];

const FormSelect = ({
  value,
  id,
  label,
  isRequired,
  disabled,
  help,
  isStateSelect,
  className,
  children,
  onChange,
}: FormSelectProps) => {
  return (
    <div className="w-full">
      <FormLabel text={label} id={id} isRequired={isRequired} />
      <select
        id={id}
        name={id}
        value={value}
        disabled={disabled}
        onChange={onChange}
        className={`${formSelectClassName} ${className}`}
        required={isRequired}
      >
        {children}
        {isStateSelect &&
          states.map((state) => (
            <option key={state} value={state}>
              {state}
            </option>
          ))}
      </select>
      <FormHelp text={help} />
    </div>
  );
};

export default FormSelect;
