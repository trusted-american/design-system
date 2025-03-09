import RouteTemplate from 'ember-route-template';
import Snippet from '../components/snippet';
import { fn } from '@ember/helper';
import {
  FormCheck,
  Heading,
  MainBody,
  Subheading,
  fileSize,
  fromNow,
  htmlSafe,
  theme,
  timestamp,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type HelpersController from '../controllers/helpers';

export default RouteTemplate<{
  Args: {
    controller: HelpersController;
  };
}>(
  <template>
    {{pageTitle "Helpers"}}
    {{breadcrumb "Helpers" route="helpers"}}

    <MainBody>
      <Heading @title="Helpers" />

      <Subheading @title="File size" />

      <Snippet @name="file-size.gts">
        {{! BEGIN-SNIPPET file-size }}
        {{fileSize 1234}}
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="From now" />

      <Snippet @name="from-now.gts">
        {{! BEGIN-SNIPPET from-now }}
        {{fromNow @controller.date}}
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="HTML safe" />

      <Snippet @name="html-safe.gts">
        {{! BEGIN-SNIPPET html-safe }}
        {{htmlSafe "<em>Test</em>"}}
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="Theme" />

      <Snippet @name="theme.gts">
        {{! BEGIN-SNIPPET theme }}
        {{theme @controller.theme}}

        <FormCheck
          @value={{@controller.isDarkTheme}}
          @label="Dark theme"
          @identifier="isDarkTheme"
          @requiredLabel="Required"
          @isSwitch={{true}}
          @onChange={{fn (mut @controller.isDarkTheme)}}
        />
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="Timestamp" />

      <Snippet @name="timestamp.gts">
        {{! BEGIN-SNIPPET timestamp }}
        <ul>
          <li>{{timestamp @controller.date}}</li>
          <li>{{timestamp @controller.date utc=true}}</li>
          <li>{{timestamp @controller.date format="date"}}</li>
          <li>{{timestamp @controller.date format="time"}}</li>
          <li>{{timestamp @controller.date format="numberDate"}}</li>
          <li>{{timestamp @controller.date format="year"}}</li>
          <li>{{timestamp @controller.date format="full"}}</li>
        </ul>
        {{! END-SNIPPET }}
      </Snippet>
    </MainBody>
  </template>,
);
