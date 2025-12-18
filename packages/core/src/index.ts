export type Color =
  | 'primary'
  | 'secondary'
  | 'success'
  | 'danger'
  | 'warning'
  | 'info';

export type Size = 'sm' | 'lg';

//

export const alertClassName = 'p-4 mb-4 rounded-md border';

export const alertVariants = {
  primary: 'bg-blue-100 text-blue-700 border-blue-400',
  secondary: 'bg-gray-100 text-gray-700 border-gray-400',
  success: 'bg-green-100 text-green-700 border-green-400',
  danger: 'bg-red-100 text-red-700 border-red-400',
  warning: 'bg-yellow-100 text-yellow-700 border-yellow-400',
  info: 'bg-blue-100 text-blue-700 border-blue-400',
};

export const avatarClassName = 'bg-green-700 text-white p-4 rounded-md';

export const buttonClassName =
  'whitespace-nowrap text-white bg-blue-400 cursor-pointer font-medium rounded-lg px-4 py-2 hover:bg-blue-500 focus:ring-4 focus:outline-none focus:ring-blue-300 disabled:bg-blue-300 disabled:cursor-not-allowed';

export const buttonVariants = {
  primary: 'text-white focus:ring-blue-300 bg-blue-700 hover:bg-blue-800',
  secondary:
    'focus:ring-gray-100 bg-white text-gray-900 focus:z-10 border border-gray-200 hover:bg-gray-100 hover:text-blue-700',
  success: 'text-white bg-green-700 hover:bg-green-800 focus:ring-green-300',
  danger: 'text-white bg-red-700 hover:bg-red-800 focus:ring-red-300',
  warning: 'text-white text-yellow-800 bg-yellow-50 border-yellow-300',
  info: 'text-white text-sky-800 bg-sky-50 border-sky-300',
};

export const cardClassName = 'bg-gray-100 rounded-xl overflow-hidden';

export const cardHoverable = 'outline-blue-400 hover:outline-2';

export const spinnerClassName =
  'w-8 h-8 text-gray-200 animate-spin dark:text-gray-600 fill-blue-400';

export const formCheckClassName =
  'rounded border-gray-300 text-orange-600 focus:ring-orange-500';

export const dateInputClassName =
  'bg-gray-100 px-3 py-2 w-full rounded-lg mt-2';

export const formHelpClassName = 'text-sm text-gray-500';

export const formInputClassName =
  'bg-gray-100 px-3 py-2 rounded-lg focus:outline-blue-400 flex-1';

export const formLabelClassName = 'font-semibold text-gray-700';

export const formSelectClassName = 'bg-gray-100 px-3 py-2 w-full rounded-lg';

export const formTextareaClassName =
  'bg-gray-100 px-3 py-2 w-full rounded-lg mt-2';
