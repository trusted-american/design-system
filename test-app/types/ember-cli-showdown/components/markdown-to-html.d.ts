import Component from '@glimmer/component';

export default class MarkdownToHtml extends Component<{
  Args: {
    markdown: string;
  };
  Element: HTMLDivElement;
}> {}
