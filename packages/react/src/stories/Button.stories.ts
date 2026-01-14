// @ts-ignore
import type { Meta, StoryObj } from '@storybook/react';
import Button from '../components/button';

const meta: Meta<typeof Button> = {
  title: 'Components/Button',
  component: Button,
  tags: ['autodocs'],
  parameters: {
    layout: 'centered',
    docs: {
      description: {
        component:
          'A versatile button component with multiple color variants, loading states, and disabled states.',
      },
    },
  },
  argTypes: {
    type: {
      control: 'select',
      options: ['button', 'submit', 'reset'],
      description: 'The HTML button type attribute',
      table: {
        defaultValue: { summary: 'button' },
      },
    },
    label: {
      control: 'text',
      description: 'The text content of the button',
    },
    color: {
      control: 'select',
      options: ['primary', 'secondary', 'success', 'danger', 'warning', 'info'],
      description: 'The color variant of the button',
      table: {
        defaultValue: { summary: 'secondary' },
      },
    },
    isLoading: {
      control: 'boolean',
      description: 'Shows a loading spinner when true',
      table: {
        defaultValue: { summary: 'false' },
      },
    },
    isDisabled: {
      control: 'boolean',
      description: 'Disables the button when true',
      table: {
        defaultValue: { summary: 'false' },
      },
    },
    className: {
      control: 'text',
      description: 'Additional CSS classes to apply',
      table: {
        defaultValue: { summary: '' },
      },
    },
    onClick: {
      action: 'clicked',
      description: 'Click handler function',
    },
  },
};

export default meta;
type Story = StoryObj<typeof Button>;

// Default story
export const Default: Story = {
  args: {
    label: 'Button',
    color: 'secondary',
  },
};

// Color variants
export const Primary: Story = {
  args: {
    label: 'Primary Button',
    color: 'primary',
  },
};

export const Secondary: Story = {
  args: {
    label: 'Secondary Button',
    color: 'secondary',
  },
};

export const Success: Story = {
  args: {
    label: 'Success Button',
    color: 'success',
  },
};
