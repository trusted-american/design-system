import { helper } from '@ember/component/helper';

const Theme = helper(function Theme([theme]: ['light' | 'dark']): void {
  document.documentElement.setAttribute('data-bs-theme', theme);
  document.body.classList.remove('highcharts-light', 'highcharts-dark');
  document.body.classList.add(`highcharts-${theme}`);
});

export default Theme;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    theme: typeof Theme;
  }
}
