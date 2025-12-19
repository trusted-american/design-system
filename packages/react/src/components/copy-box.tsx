import { copyBoxBase } from '@trusted-american/core';
import { useState } from 'react';

interface CopyBoxProps {
  text: string;
  className?: string;
}

const CopyBox = ({ text, className }: CopyBoxProps) => {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 1500);
    } catch {
      alert('Copy failed');
    }
  };

  return (
    <div className={`$${copyBoxBase} ${className}`}>
      <input
        className={'truncate rounded bg-gray-100 px-3 py-2'}
        type="text"
        readOnly
        title={text}
        value={text}
      />
      <button
        onClick={handleCopy}
        className={`flex h-9 w-9 items-center justify-center rounded-md border transition
          ${
            copied
              ? 'border-blue-600 bg-blue-600 text-white'
              : 'border-gray-300 hover:bg-gray-100'
          }
        `}
      >
        {copied ? '✓' : '📋'}
      </button>
    </div>
  );
};

export default CopyBox;
