import type AlertComponent from './components/alert';
import type AsideComponent from './components/aside';
import type AvatarComponent from './components/avatar';
import type BadgeComponent from './components/badge';
import type BreadcrumbTrailComponent from './components/breadcrumb-trail';
import type ButtonComponent from './components/button';
import type ButtonSetComponent from './components/button-set';
import type CardComponent from './components/card';
import type CloseButtonComponent from './components/close-button';
import type DropdownComponent from './components/dropdown';
import type ExternalLinkComponent from './components/external-link';
import type FileTypeComponent from './components/file-type';
import type FlyoutComponent from './components/flyout';
import type HeadingComponent from './components/heading';
import type ListFilterComponent from './components/list-filter';
import type ListGroupComponent from './components/list-group';
import type LoaderComponent from './components/loader';
import type MainComponent from './components/main';
import type ModalComponent from './components/modal';
import type NavComponent from './components/nav';
import type PlaceholderComponent from './components/placeholder';
import type PropertyListComponent from './components/property-list';
import type SkeletonComponent from './components/skeleton';
import type StatCardComponent from './components/stat-card';
import type SubheadingComponent from './components/subheading';
import type TableComponent from './components/table';
import type ToastComponent from './components/toast';

import type AsideItemComponent from './components/aside/item';

import type DropdownItemComponent from './components/dropdown/item';
import type DropdownDividerComponent from './components/dropdown/divider';

import type FormCheckComponent from './components/form/check';
import type FormDateInputComponent from './components/form/date-input';
import type FormErrorComponent from './components/form/error';
import type FormFileInputComponent from './components/form/file-input';
import type FormHelpComponent from './components/form/help';
import type FormInputComponent from './components/form/input';
import type FormLabelComponent from './components/form/label';
import type FormPhoneInputComponent from './components/form/phone-input';
import type FormRadioButtonComponent from './components/form/radio-button';
import type FormRadioCardComponent from './components/form/radio-card';
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
  Alert: typeof AlertComponent;
  Aside: typeof AsideComponent;
  Avatar: typeof AvatarComponent;
  Badge: typeof BadgeComponent;
  BreadcrumbTrail: typeof BreadcrumbTrailComponent;
  Button: typeof ButtonComponent;
  ButtonSet: typeof ButtonSetComponent;
  Card: typeof CardComponent;
  CloseButton: typeof CloseButtonComponent;
  Dropdown: typeof DropdownComponent;
  ExternalLink: typeof ExternalLinkComponent;
  FileType: typeof FileTypeComponent;
  Flyout: typeof FlyoutComponent;
  Heading: typeof HeadingComponent;
  ListFilter: typeof ListFilterComponent;
  ListGroup: typeof ListGroupComponent;
  Loader: typeof LoaderComponent;
  Main: typeof MainComponent;
  Modal: typeof ModalComponent;
  Nav: typeof NavComponent;
  Placeholder: typeof PlaceholderComponent;
  PropertyList: typeof PropertyListComponent;
  Skeleton: typeof SkeletonComponent;
  StatCard: typeof StatCardComponent;
  Subheading: typeof SubheadingComponent;
  Table: typeof TableComponent;
  Toast: typeof ToastComponent;

  'Aside::Item': typeof AsideItemComponent;

  'Dropdown::Item': typeof DropdownItemComponent;
  'Dropdown::Divider': typeof DropdownDividerComponent;

  'Form::Check': typeof FormCheckComponent;
  'Form::DateInput': typeof FormDateInputComponent;
  'Form::Error': typeof FormErrorComponent;
  'Form::FileInput': typeof FormFileInputComponent;
  'Form::Help': typeof FormHelpComponent;
  'Form::Input': typeof FormInputComponent;
  'Form::Label': typeof FormLabelComponent;
  'Form::PhoneInput': typeof FormPhoneInputComponent;
  'Form::RadioButton': typeof FormRadioButtonComponent;
  'Form::RadioCard': typeof FormRadioCardComponent;
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
