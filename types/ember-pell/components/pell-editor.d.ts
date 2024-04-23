import Component from '@glimmer/component';

export default class PellEditor extends Component<{
  Args: {
    value: string | null;
    onChange: (value: string) => void;
  };
  Element: HTMLElement;
}> {}
