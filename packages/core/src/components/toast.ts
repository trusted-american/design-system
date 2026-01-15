export const toastBase = `d-flex flex-col w-full max-w-md bg-white rounded-lg border border-gray-200 shadow-lg text-sm`;
export const toastVariants = {
  primary: {
    title: 'bg-blue-300 text-black',
    body: 'bg-blue-500 text-white',
  },
  secondary: {
    title: 'bg-gray-300 text-black',
    body: 'bg-gray-500 text-white',
  },
  success: {
    title: 'bg-green-300 text-black',
    body: 'bg-green-500 text-white',
  },
  danger: {
    title: 'bg-red-300 text-black',
    body: 'bg-red-500 text-white',
  },
  warning: {
    title: 'bg-yellow-300 text-black',
    body: 'bg-yellow-500 text-white',
  },
  info: {
    title: 'bg-sky-300 text-black',
    body: 'bg-sky-500 text-white',
  },
  upsell: {
    title: 'bg-purple-300 text-black',
    body: 'bg-purple-500 text-white',
  },
} as const;
