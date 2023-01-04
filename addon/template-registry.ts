import type AsideComponent from '@trusted-american/design-system/components/aside';
import type AvatarComponent from '@trusted-american/design-system/components/avatar';
import type BreadcrumbTrailComponent from '@trusted-american/design-system/components/breadcrumb-trail';
import type ExternalLinkComponent from '@trusted-american/design-system/components/external-link';
import type HeadingComponent from '@trusted-american/design-system/components/heading';
import type ListFilter from '@trusted-american/design-system/components/list-filter';
import type MainComponent from '@trusted-american/design-system/components/main';
import type PlaceholderComponent from '@trusted-american/design-system/components/placeholder';
import type PropertyListComponent from '@trusted-american/design-system/components/property-list';
import type StatCardComponent from '@trusted-american/design-system/components/stat-card';
import type SubheadingComponent from '@trusted-american/design-system/components/subheading';
import type ToastComponent from '@trusted-american/design-system/components/toast';

import type FormCheckComponent from '@trusted-american/design-system/components/form/check';
import type FormDateInputComponent from '@trusted-american/design-system/components/form/date-input';
import type FormFileInputComponent from '@trusted-american/design-system/components/form/file-input';
import type FormInputComponent from '@trusted-american/design-system/components/form/input';
import type FormPhoneInputComponent from '@trusted-american/design-system/components/form/phone-input';
import type FormRadioBtnComponent from '@trusted-american/design-system/components/form/radio-btn';
import type FormRadioComponent from '@trusted-american/design-system/components/form/radio';
import type FormSelectComponent from '@trusted-american/design-system/components/form/select';
import type FormTextareaComponent from '@trusted-american/design-system/components/form/textarea';

import type MainBodyComponent from '@trusted-american/design-system/components/main/body';
import type MainFooterComponent from '@trusted-american/design-system/components/main/footer';
import type MainHeaderComponent from '@trusted-american/design-system/components/main/header';
import type MainTopHeaderComponent from '@trusted-american/design-system/components/main/top-header';

import type PropertyListItemComponent from '@trusted-american/design-system/components/property-list/item';

import type fileSize from '@trusted-american/design-system/helpers/file-size';
import type fromNow from '@trusted-american/design-system/helpers/from-now';
import type timestamp from '@trusted-american/design-system/helpers/timestamp';

export default interface Registry {
  Aside: typeof AsideComponent;
  Avatar: typeof AvatarComponent;
  BreadcrumbTrail: typeof BreadcrumbTrailComponent;
  ExternalLink: typeof ExternalLinkComponent;
  Heading: typeof HeadingComponent;
  ListFilter: typeof ListFilter;
  Main: typeof MainComponent;
  Placeholder: typeof PlaceholderComponent;
  PropertyList: typeof PropertyListComponent;
  StatCard: typeof StatCardComponent;
  Subheading: typeof SubheadingComponent;
  Toast: typeof ToastComponent;

  'Form::Check': typeof FormCheckComponent;
  'Form::DateInput': typeof FormDateInputComponent;
  'Form::FileInput': typeof FormFileInputComponent;
  'Form::Input': typeof FormInputComponent;
  'Form::PhoneInput': typeof FormPhoneInputComponent;
  'Form::RadioBtn': typeof FormRadioBtnComponent;
  'Form::Radio': typeof FormRadioComponent;
  'Form::Select': typeof FormSelectComponent;
  'Form::Textarea': typeof FormTextareaComponent;

  'Main::Body': typeof MainBodyComponent;
  'Main::Footer': typeof MainFooterComponent;
  'Main::Header': typeof MainHeaderComponent;
  'Main::TopHeader': typeof MainTopHeaderComponent;

  'PropertyList::Item': typeof PropertyListItemComponent;

  'file-size': typeof fileSize;
  'from-now': typeof fromNow;
  timestamp: typeof timestamp;
}
