import Component from '@glimmer/component';

export default class PellEditor extends Component<{
  Args: {
    value: string | null;
    pellOptions?: Record<string, unknown>;
    onChange: (value: string) => void;
  };
  Element: HTMLElement;
}> {}
