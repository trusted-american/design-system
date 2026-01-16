import { render, screen } from '@testing-library/react';
import Button from './button';
import { test, expect } from 'vitest';

test('renders button', () => {
  render(<Button label="Primary Button!" />);
  expect(screen.getByText('Primary Button!')).toBeInTheDocument();
});
