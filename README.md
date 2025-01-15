# design-system

[![Netlify Status](https://api.netlify.com/api/v1/badges/31622054-f4d9-43c4-bce5-a45f37faf48b/deploy-status)](https://app.netlify.com/sites/taia-design-system/deploys)

Components for building robust user interfaces.

## Compatibility

- Ember.js v4.8 or above
- Ember CLI v4.8 or above
- Node.js v18 or above

## Installation

```
ember install @trusted-american/design-system
```

## Usage

```hbs
{{! app/templates/application.hbs }}

{{page-title "Title"}}
{{breadcrumb "Title" route="index"}}

<Aside
  @title="Title"
  @logo="/logo.svg"
  @route="index"
  @isCollapsed={{false}}
  @onChange={{(noop)}}
>
  <Aside::Item @text="Link 1" @route="index" @icon="house" />
  <Aside::Item @text="Link 2" @route="index" @icon="house" />
  <Aside::Item @text="Link 3" @route="index" @icon="house" />
</Aside>

<Main>
  <Main::TopHeader>
    <BreadcrumbTrail />
  </Main::TopHeader>

  <Main::Body>
    Body
  </Main::Body>

  <Main::Footer>
    Footer
  </Main::Footer>
</Main>
```

## Contributing

See the [Contributing](CONTRIBUTING.md) guide for details.

## License

This project is licensed under the [MIT License](LICENSE.md).
