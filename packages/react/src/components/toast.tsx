import { toastBase2, toastVariants, type Color } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface ToastProps {
  color?: Color;
  title?: string;
  body: ReactNode;
  onClose?: () => void;
}

const Toast = ({ color = 'primary', title, body, onClose }: ToastProps) => {
  return (
    <div className={`${toastBase2} ${toastVariants[color]}`} role="alert">
      <div className="p-4">
        <svg
          className="w-6 h-6 text-fg-brand"
          aria-hidden="true"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          strokeWidth={2}
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            d="M18.122 17.645a7.185 7.185 0 0 1-2.656 2.495 7.06 7.06 0 0 1-3.52.853 6.617 6.617 0 0 1-3.306-.718 6.73 6.73 0 0 1-2.54-2.266c-2.672-4.57.287-8.846.887-9.668A4.448 4.448 0 0 0 8.07 6.31 4.49 4.49 0 0 0 7.997 4c1.284.965 6.43 3.258 5.525 10.631 1.496-1.136 2.7-3.046 2.846-6.216 1.43 1.061 3.985 5.462 1.754 9.23Z"
          />
        </svg>
      </div>

      <div className="flex-1 p-4 flex flex-col ">
        {title && (
          <>
            <div className="text-sm font-semibold">{title}</div>
            <hr className="border-t border-neutral-secondary my-2 w-full m-0" />
          </>
        )}
        <div className="text-sm">{body}</div>
      </div>

      {onClose && (
        <div className="shrink-0 p-4">
          <button
            onClick={onClose}
            type="button"
            className="flex items-center justify-center text-body hover:text-heading bg-transparent border border-transparent hover:bg-neutral-secondary-medium focus:ring-4 focus:ring-neutral-tertiary font-medium rounded text-sm h-8 w-8 focus:outline-none"
            aria-label="Close"
          >
            <span className="sr-only">Close</span>
            <svg
              className="w-5 h-5"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              strokeWidth={2}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M6 18L18 6M18 18L6 6"
              />
            </svg>
          </button>
        </div>
      )}
    </div>
  );
};

export default Toast;
