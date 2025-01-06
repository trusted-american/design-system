import Helper from '@ember/component/helper';
import localStorage from 'ember-local-storage-decorator';

interface ThemeSignature {
  Args: {
    Positional: [];
  };
  Return: void; // eslint-disable-line @typescript-eslint/no-invalid-void-type
}

export default class Theme extends Helper<ThemeSignature> {
  @localStorage theme: 'light' | 'dark' = 'light';

  compute(): void {
    console.log('hey');
    const { theme } = this;

    document.documentElement.setAttribute('data-bs-theme', theme);

    document.body.classList.remove('highcharts-light', 'highcharts-dark');
    document.body.classList.add(`highcharts-${theme}`);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    theme: typeof Theme;
  }
}
