import type { TOC } from '@ember/component/template-only';
import Link, { type LinkSignature } from '../link';

// prettier-ignore
<template><Link
    @route={{@route}}
    @model={{@model}}
    @query={{@query}}
    @href={{@href}}
    @isLocalHref={{@isLocalHref}}
    @label={{@label}}
    @icon={{@icon}}
    @isIconTrailing={{@isIconTrailing}}
    @isIconOnly={{@isIconOnly}}
    class="alert-link"
    data-test-alert-link
    ...attributes
  >{{yield}}</Link></template> satisfies TOC<LinkSignature>;
