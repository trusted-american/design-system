import { toastBase, toastVariants, type Color } from '@trusted-american/core';
import type { ReactNode } from 'react';

interface ToastProps {
  color?: Color;
  title?: string;
  body: ReactNode;
  onClose?: () => void;
}

const Toast = ({ color = 'primary', title, body, onClose }: ToastProps) => {
  return (
    <div
      className="max-w-full bg-white rounded-lg border border-gray-200 shadow-lg text-sm"
      role="alert"
      aria-live="assertive"
      aria-atomic="true"
    >
      <div className="flex items-center gap-2 px-3 py-2 bg-gray-50 border-b border-gray-200 rounded-t-lg">
        <img src="..." className="w-5 h-5 rounded" alt="..." />
        <strong className="mr-auto">Bootstrap</strong>
        <small className="text-gray-500">11 mins ago</small>
        <button
          type="button"
          className="p-1 text-gray-400 hover:text-gray-600"
          aria-label="Close"
        >
          <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
          </svg>
        </button>
      </div>
      <div className="px-3 py-3">Hello, world! This is a toast message.</div>
    </div>
  );
};

export default Toast;
