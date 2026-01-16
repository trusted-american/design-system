'use client';
// @ts-ignore
import type { Meta, StoryObj } from '@storybook/react';
import { useState } from 'react';
import ToastContainer from '../components/toast-container';

const meta: Meta<typeof ToastContainer> = {
  title: 'Components/ToastContainer',
  component: ToastContainer,
  tags: ['autodocs'],
  parameters: {
    layout: 'centered',
    docs: {
      description: {
        component:
          'A versatile toast container component with multiple color variants, loading states, and disabled states.',
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

type Story = StoryObj<typeof ToastContainer>;
// Color variants

export const Default: Story = {
  args: {
    color: 'primary',
    title: 'title',
    body: 'This is a default toast message!!~@',
  },
};
