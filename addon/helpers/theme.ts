import { helper } from '@ember/component/helper';

export type Theme = 'light' | 'dark';

const theme = helper(function theme([theme]: [Theme]): void {
  document.documentElement.setAttribute('data-bs-theme', theme);

  // TODO: package shouldn't know about highcharts
  document.body.classList.remove('highcharts-light', 'highcharts-dark');
  document.body.classList.add(`highcharts-${theme}`);
});

export default theme;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    theme: typeof theme;
  }
}
