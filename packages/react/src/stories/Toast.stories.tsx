'use client';
// @ts-ignore
import type { Meta, StoryObj } from '@storybook/react';
import Toast from '../components/toast';
import { useState } from 'react';

const meta: Meta<typeof Toast> = {
  title: 'Components/Toast',
  component: Toast,
  tags: ['autodocs'],
  parameters: {
    layout: 'centered',
    docs: {
      description: {
        component:
          'A versatile toast component with multiple color variants, loading states, and disabled states.',
      },
    },
  },
  argTypes: {
    color: {
      control: 'select',
      options: ['primary', 'secondary', 'success', 'danger', 'warning', 'info'],
      description: 'The color variant of the button',
      table: {
        defaultValue: { summary: 'secondary' },
      },
    },
  },
};

export default meta;

type Story = StoryObj<typeof Toast>;
// Color variants

export const Default: Story = {
  render: (args: any) => {
    const [open, setOpen] = useState(true);
    return (
      <>
        {open && (
          <Toast {...args} onClose={() => setOpen(false)}>
            {args.body}
          </Toast>
        )}
      </>
    );
  },
  args: {
    color: 'primary',
    title: 'his is a default toast title!! his is a default toast title!!',
    body: 'This is a default toast message!! This is a default toast message!!',
  },
};
