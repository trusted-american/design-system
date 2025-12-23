import {
  modalBackground,
  modalBase,
  modalBody,
  modalCloseButton,
  modalHeader,
  modalTitle,
} from '@trusted-american/core';
import type { ReactNode } from 'react';
import CloseButton from './close-button';

interface ModalProps {
  title: string;
  children: ReactNode;
  onClose: () => void;
}

const Modal = ({ title, children, onClose }: ModalProps) => {
  return (
    <div className={modalBackground}>
      <div className={modalBase}>
        <div className={modalHeader}>
          <h3 className={modalTitle}>{title}</h3>
          <button className={modalCloseButton} onClick={onClose}>
            <CloseButton />
          </button>
        </div>
        <div className={modalBody}>{children}</div>
      </div>
    </div>
  );
};

export default Modal;
