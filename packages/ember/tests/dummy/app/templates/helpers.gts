import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import {
  FormCheck,
  Heading,
  MainBody,
  Subheading,
  fileSize,
  fromNow,
  theme,
  timestamp,
} from '@trusted-american/ember';
import type { Theme } from '@trusted-american/ember/helpers/theme';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../components/snippet';
import type HelpersRoute from '../routes/helpers';

interface HelpersSignature {
  Args: {
    model: ModelFrom<HelpersRoute>;
  };
}

export default class Helpers extends Component<HelpersSignature> {
  date = new Date();

  @tracked theme: Theme = 'light';

  get isDarkTheme(): boolean {
    return this.theme === 'dark';
  }
  set isDarkTheme(value: boolean) {
    this.theme = value ? 'dark' : 'light';
  }

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
        {{fromNow this.date}}
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="Theme" />

      <Snippet @name="theme.gts">
        {{! BEGIN-SNIPPET theme }}
        {{theme this.theme}}

        <FormCheck
          @value={{this.isDarkTheme}}
          @label="Dark theme"
          @identifier="isDarkTheme"
          @requiredLabel="Required"
          @isSwitch={{true}}
          @onChange={{fn (mut this.isDarkTheme)}}
        />
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="Timestamp" />

      <Snippet @name="timestamp.gts">
        {{! BEGIN-SNIPPET timestamp }}
        <ul>
          <li>{{timestamp this.date}}</li>
          <li>{{timestamp this.date utc=true}}</li>
          <li>{{timestamp this.date format="date"}}</li>
          <li>{{timestamp this.date format="time"}}</li>
          <li>{{timestamp this.date format="numberDate"}}</li>
          <li>{{timestamp this.date format="year"}}</li>
          <li>{{timestamp this.date format="full"}}</li>
        </ul>
        {{! END-SNIPPET }}
      </Snippet>
    </MainBody>
  </template>
}
