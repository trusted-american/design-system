import type AsideComponent from './components/aside';
import type AvatarComponent from './components/avatar';
import type BreadcrumbTrailComponent from './components/breadcrumb-trail';
import type ExternalLinkComponent from './components/external-link';
import type HeadingComponent from './components/heading';
import type ListFilter from './components/list-filter';
import type MainComponent from './components/main';
import type PlaceholderComponent from './components/placeholder';
import type PropertyListComponent from './components/property-list';
import type StatCardComponent from './components/stat-card';
import type SubheadingComponent from './components/subheading';
import type TableComponent from './components/table';
import type ToastComponent from './components/toast';

import type FormCheckComponent from './components/form/check';
import type FormDateInputComponent from './components/form/date-input';
import type FormFileInputComponent from './components/form/file-input';
import type FormInputComponent from './components/form/input';
import type FormPhoneInputComponent from './components/form/phone-input';
import type FormRadioBtnComponent from './components/form/radio-btn';
import type FormRadioComponent from './components/form/radio';
import type FormSelectComponent from './components/form/select';
import type FormTextareaComponent from './components/form/textarea';

import type MainBodyComponent from './components/main/body';
import type MainFooterComponent from './components/main/footer';
import type MainHeaderComponent from './components/main/header';
import type MainTopHeaderComponent from './components/main/top-header';

import type PropertyListItemComponent from './components/property-list/item';

import type fileSize from './helpers/file-size';
import type fromNow from './helpers/from-now';
import type timestamp from './helpers/timestamp';

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
  Table: typeof TableComponent;
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
