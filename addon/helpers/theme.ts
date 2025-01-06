import { helper } from '@ember/component/helper';

const Theme = helper(function Theme([isDarkMode]: ['light' | 'dark']): void {
  document.documentElement.setAttribute('data-bs-theme', isDarkMode);
  document.body.classList.remove('highcharts-light', 'highcharts-dark');
  document.body.classList.add(`highcharts-${isDarkMode}`);
});

export default Theme;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    theme: typeof Theme;
  }
}
