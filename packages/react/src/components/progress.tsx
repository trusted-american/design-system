interface ProgressProps {
  value: number;
}

const Progress = ({ value }: ProgressProps) => {
  return (
    <div className="w-full bg-neutral-quaternary rounded-full h-2">
      <div
        className="bg-brand h-2 rounded-full"
        style={{ width: `${(value * 100).toString()}%` }}
      ></div>
    </div>
  );
};

export default Progress;
