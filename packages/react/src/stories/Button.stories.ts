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

export const Danger: Story = {
  args: {
    label: 'Danger Button',
    color: 'danger',
  },
};

export const Warning: Story = {
  args: {
    label: 'Warning Button',
    color: 'warning',
  },
};

export const Info: Story = {
  args: {
    label: 'Info Button',
    color: 'info',
  },
};

// States
export const Loading: Story = {
  args: {
    label: 'Loading...',
    color: 'primary',
    isLoading: true,
  },
};

export const Disabled: Story = {
  args: {
    label: 'Disabled Button',
    color: 'primary',
    isDisabled: true,
  },
};

export const LoadingAndDisabled: Story = {
  args: {
    label: 'Please wait...',
    color: 'primary',
    isLoading: true,
    isDisabled: true,
  },
};

// Button types
export const SubmitButton: Story = {
  args: {
    type: 'submit',
    label: 'Submit Form',
    color: 'success',
  },
};

export const ResetButton: Story = {
  args: {
    type: 'reset',
    label: 'Reset Form',
    color: 'warning',
  },
};

// With custom class
export const WithCustomClass: Story = {
  args: {
    label: 'Custom Styled',
    color: 'primary',
    className: 'custom-button-class',
  },
};
