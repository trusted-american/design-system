import { helper } from '@ember/component/helper';

export type Theme = 'light' | 'dark';

const theme = helper(function theme([theme]: [Theme]): void {
  document.documentElement.setAttribute('data-bs-theme', theme);
});

export default theme;
