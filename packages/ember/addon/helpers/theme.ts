export type Theme = 'light' | 'dark';

export default function theme(theme: Theme): void {
  document.documentElement.setAttribute('data-bs-theme', theme);
}
