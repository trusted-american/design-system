import '@glint/environment-ember-loose';
import { ComponentLike, HelperLike, ModifierLike } from '@glint/template';
import EmberSimpleBootstrapRegistry from 'ember-simple-bootstrap/template-registry';

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends EmberSimpleBootstrapRegistry {
    // @ember/render-modifiers

    'did-insert': ModifierLike<{
      Element: HTMLElement;
      Args: { Positional: [(element: HTMLElement) => void] };
    }>;

    // @fortawesome/ember-fontawesome

    FaIcon: ComponentLike<{
      Element: HTMLElement;
      Args: {
        icon: string;
        fixedWidth?: boolean;
        size?: string;
        prefix?: string;
        transform?: string;
      };
    }>;

    // ember-breadcrumb-trail

    breadcrumb: HelperLike<{
      Args: {
        Positional: [title: string];
        Named: Record<string, unknown>;
      };
      Return: void;
    }>;
    breadcrumbs: HelperLike<{
      Return: { title: string; data: { route: string; model: string } }[];
    }>;

    // ember-cli-clipboard

    CopyButton: ComponentLike<{
      Element: HTMLElement;
      Args: {
        text: unknown;
        delegateClickEvent?: boolean;
      };
      Blocks: {
        default: [];
      };
    }>;

    // ember-composable-helpers

    'has-next': HelperLike<{
      Args: { Positional: [unknown, unknown[]] };
      Return: boolean;
    }>;
    includes: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    noop: HelperLike<{
      Return: () => void;
    }>;
    or: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: unknown;
    }>;
    pick: HelperLike<{
      Args: { Positional: [string, (...args: never[]) => unknown] };
      Return: () => void;
    }>;

    // ember-math-helpers

    dec: HelperLike<{
      Args: {
        Positional: [value: number | unknown];
      };
      Return: number;
    }>;

    inc: HelperLike<{
      Args: {
        Positional: [value: number | unknown];
      };
      Return: number;
    }>;

    // ember-page-title

    'page-title': HelperLike<{
      Args: { Positional: [title: string] };
      Return: void;
    }>;

    // ember-truth-helpers

    and: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    eq: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    gt: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    gte: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    not: HelperLike<{
      Args: { Positional: [...value: unknown[]] };
      Return: boolean;
    }>;
    'not-eq': HelperLike<{
      Args: { Positional: [...values: unknown[]] };
      Return: boolean;
    }>;
  }
}
