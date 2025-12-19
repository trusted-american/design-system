import {
  modalBackground,
  modalBase,
  modalChildren,
  modalCloseButton,
  modalHeader,
  modalTitle,
} from '@trusted-american/core';
import { ReactNode } from 'react';

interface ModalProps {
  children: ReactNode;
  title: string;
  onClose: () => void;
}

const Modal = ({ children, title, onClose }: ModalProps) => {
  return (
    <div className={modalBase}>
      <div className={modalBackground}>
        <div className={modalHeader}>
          <h3 className={modalTitle}>{title}</h3>
          <button
            id="closeModalBtn"
            className={modalCloseButton}
            onClick={onClose}
          >
            &times;
          </button>
        </div>
        <div className={modalChildren}>{children}</div>
      </div>
    </div>
  );
};

export default Modal;
