import { action } from '@ember/object';
import Component from '@glimmer/component';
import { Heading, MainBody, Subheading } from '@trusted-american/design-system';
import checkValidity from '@trusted-american/design-system/utils/check-validity';
import fileType from '@trusted-american/design-system/utils/file-type';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../components/snippet';
import type UtilsRoute from '../routes/utils';

interface UtilsSignature {
  Args: {
    model: ModelFrom<UtilsRoute>;
  };
}

export default class Utils extends Component<UtilsSignature> {
  // BEGIN-SNIPPET util-check-validity
  @action
  @checkValidity
  submit() {
    alert('Action');
  }
  // END-SNIPPET

  // BEGIN-SNIPPET util-file-type
  type = fileType('file.xlsx');
  // END-SNIPPET

  // BEGIN-SNIPPET util-is-valid-date
  isValid = isValidDate(new Date());
  // END-SNIPPET

  <template>
    {{pageTitle "Utils"}}
    {{breadcrumb "Utils" route="utils"}}

    <MainBody>
      <Heading @title="Utils" />

      <Subheading @title="Check validity" />

      <Snippet @name="util-check-validity.gts" />

      <Subheading @title="File type" />

      <Snippet @name="util-file-type.gts">
        {{this.type}}
      </Snippet>

      <Subheading @title="Is valid date" />

      <Snippet @name="util-is-valid-date.gts">
        {{this.isValid}}
      </Snippet>
    </MainBody>
  </template>
}
