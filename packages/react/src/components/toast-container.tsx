import Toast from './toast';
import { ReactNode, useState } from 'react';
import { type Color } from '@trusted-american/core';

interface ToastContainerProps {
  color?: Color;
  title?: ReactNode;
  body: ReactNode;
  onClose?: () => void;
}

export default function ToastContainer({
  color,
  title,
  body,
  onClose,
}: ToastContainerProps) {
  const [open, setOpen] = useState(true);

  return (
    <div className="fixed bottom-4 right-4 flex flex-col gap-2 z-50">
      {open && (
        <Toast
          title={title}
          body={body}
          onClose={() => setOpen(false)}
          color={color}
        />
      )}
    </div>
  );
}
