import {
  copyBoxBase,
  copyBoxButton,
  copyBoxButtonBorder,
  copyBoxButtonBorderActive,
  copyBoxInput,
} from '@trusted-american/core';
import { useState } from 'react';

interface CopyBoxProps {
  value: string;
  className?: string;
}

const CopyBox = ({ value, className }: CopyBoxProps) => {
  const [isCopied, setIsCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(value);
      setIsCopied(true);
      setTimeout(() => setIsCopied(false), 1500);
    } catch {
      alert('Copy failed');
    }
  };

  return (
    <div className={`${copyBoxBase} ${className}`}>
      <input
        className={copyBoxInput}
        type="text"
        readOnly
        title={value}
        value={value}
      />
      <button
        onClick={handleCopy}
        className={`${copyBoxButton}
          ${isCopied ? copyBoxButtonBorderActive : copyBoxButtonBorder}
        `}
      >
        {isCopied ? '✓' : '📋'}
      </button>
    </div>
  );
};

export default CopyBox;
