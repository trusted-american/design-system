import { toastBase, toastVariants, type Color } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface ToastProps {
  color?: Color;
  title?: ReactNode;
  body: ReactNode;
  onClose?: () => void;
}

const Toast = ({ color = 'primary', title, body, onClose }: ToastProps) => {
  const style = toastVariants[color ?? 'primary'];
  return (
    <div
      className={`${toastBase}`}
      role="alert"
      aria-live="assertive"
      aria-atomic="true"
    >
      {title && (
        <div
          className={`flex items-center gap-2 px-3 py-2 border-b border-gray-500 rounded-t-lg ${style.title}`}
        >
          <svg
            className="w-6 h-6 text-fg-brand"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            fill="none"
            viewBox="0 0 24 24"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M18.122 17.645a7.185 7.185 0 0 1-2.656 2.495 7.06 7.06 0 0 1-3.52.853 6.617 6.617 0 0 1-3.306-.718 6.73 6.73 0 0 1-2.54-2.266c-2.672-4.57.287-8.846.887-9.668A4.448 4.448 0 0 0 8.07 6.31 4.49 4.49 0 0 0 7.997 4c1.284.965 6.43 3.258 5.525 10.631 1.496-1.136 2.7-3.046 2.846-6.216 1.43 1.061 3.985 5.462 1.754 9.23Z"
            />
          </svg>
          <strong className="mr-auto">{title}</strong>
          {onClose && (
            <button
              type="button"
              className="p-1 text-gray-400 hover:text-gray-600"
              aria-label="Close"
              onClick={onClose}
            >
              <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
              </svg>
            </button>
          )}
        </div>
      )}

      <div className={`flex items-start px-3 py-3 gap-2 ${style.body}`}>
        <div className={`grow wrap-break-words`}>{body}</div>

        {!title && onClose && (
          <button
            type="button"
            className="p-1 text-gray-400 hover:text-gray-600 self-start"
            aria-label="Close"
            onClick={onClose}
          >
            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
            </svg>
          </button>
        )}
      </div>
    </div>
  );
};

export default Toast;
