import Helper from '@ember/component/helper';
import localStorage from 'ember-local-storage-decorator';

interface ThemeSignature {
  Args: {
    Positional: [];
  };
  Return: void; // eslint-disable-line @typescript-eslint/no-invalid-void-type
}

export default class Theme extends Helper<ThemeSignature> {
  @localStorage isDarkMode: 'light' | 'dark' = 'light';

  compute(): void {
    const { isDarkMode } = this;

    document.documentElement.setAttribute('data-bs-theme', isDarkMode);

    document.body.classList.remove('highcharts-light', 'highcharts-dark');
    document.body.classList.add(`highcharts-${isDarkMode}`);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    theme: typeof Theme;
  }
}
