import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import { htmlSafe } from '@ember/template';
import { DEFAULT_SIZE, generateIdenticon } from '@trusted-american/core';
import { or } from 'ember-truth-helpers';

export interface AvatarSignature {
  Args: {
    id: string;
    url?: string | null;
    alt: string;
    size?: number;
  };
  Element: HTMLImageElement;
}

<template>
  <img
    src={{or @url (generateIdenticon @id)}}
    alt={{@alt}}
    class="rounded-circle"
    style={{htmlSafe
      (concat
        "object-fit: cover; width: "
        (or @size DEFAULT_SIZE)
        "rem; height: "
        (or @size DEFAULT_SIZE)
        "rem;"
      )
    }}
    data-test-avatar
    ...attributes
  />
</template> satisfies TOC<AvatarSignature>;
