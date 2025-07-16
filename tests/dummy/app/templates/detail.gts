import {
  Alert,
  Button,
  Card,
  Heading,
  MainBody,
  MainHeader,
  Nav,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import {
  faAngleDown,
  faBoxArchive,
  faCircleExclamation,
} from '@fortawesome/free-solid-svg-icons';

<template>
  {{pageTitle "Detail"}}
  {{breadcrumb "Detail" route="detail"}}

  <MainHeader>
    <Alert @icon={{faBoxArchive}}>
      Test
    </Alert>

    <Alert @color="warning" @icon={{faCircleExclamation}}>
      Test
    </Alert>

    <Heading
      @title="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
      @type="Type"
      @identifier="1234567890"
    >
      <Button
        @label="Actions"
        @icon={{faAngleDown}}
        @isIconTrailing={{true}}
        @color="primary"
      />
    </Heading>

    <Nav as |nav|>
      <nav.item @route="detail" @label="First" />
      <nav.item @route="index" @label="Second" />
      <nav.item @route="index" @label="Third" />
      <nav.item @route="index" @label="Fourth" />
      <nav.item @route="index" @label="Fifth" />
      <nav.item @route="index" @label="Sixth" />
      <nav.item @route="index" @label="Seventh" />
      <nav.item @route="index" @label="Eighth" />
    </Nav>
  </MainHeader>

  <MainBody>
    <Card as |card|>
      <card.body>
        Body
      </card.body>
    </Card>
  </MainBody>
</template>
