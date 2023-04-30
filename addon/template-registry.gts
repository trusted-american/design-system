import type Alert from './components/alert';
import type Aside from './components/aside';
import type Avatar from './components/avatar';
import type Badge from './components/badge';
import type BreadcrumbTrail from './components/breadcrumb-trail';
import type Button from './components/button';
import type ButtonSet from './components/button-set';
import type Card from './components/card';
import type CloseButton from './components/close-button';
import type Dropdown from './components/dropdown';
import type ExternalLink from './components/external-link';
import type FileType from './components/file-type';
import type Flyout from './components/flyout';
import type Heading from './components/heading';
import type ListFilter from './components/list-filter';
import type ListGroup from './components/list-group';
import type Loader from './components/loader';
import type Main from './components/main';
import type Modal from './components/modal';
import type Nav from './components/nav';
import type Placeholder from './components/placeholder';
import type PropertyList from './components/property-list';
import type Skeleton from './components/skeleton';
import type StatCard from './components/stat-card';
import type Subheading from './components/subheading';
import type Table from './components/table';
import type Toast from './components/toast';

import type AsideItem from './components/aside/item';

import type DropdownItem from './components/dropdown/item';
import type DropdownDivider from './components/dropdown/divider';

import type FormCheck from './components/form/check';
import type FormDateInput from './components/form/date-input';
import type FormError from './components/form/error';
import type FormFileInput from './components/form/file-input';
import type FormHelp from './components/form/help';
import type FormInput from './components/form/input';
import type FormLabel from './components/form/label';
import type FormPhoneInput from './components/form/phone-input';
import type FormRadioButton from './components/form/radio-button';
import type FormRadioCard from './components/form/radio-card';
import type FormRadio from './components/form/radio';
import type FormSelect from './components/form/select';
import type FormTextarea from './components/form/textarea';

import type MainBody from './components/main/body';
import type MainFooter from './components/main/footer';
import type MainHeader from './components/main/header';
import type MainTopHeader from './components/main/top-header';

import type PropertyListItem from './components/property-list/item';

import type fileSize from './helpers/file-size';
import type fromNow from './helpers/from-now';
import type timestamp from './helpers/timestamp';

export default interface Registry {
  Alert: typeof Alert;
  Aside: typeof Aside;
  Avatar: typeof Avatar;
  Badge: typeof Badge;
  BreadcrumbTrail: typeof BreadcrumbTrail;
  Button: typeof Button;
  ButtonSet: typeof ButtonSet;
  Card: typeof Card;
  CloseButton: typeof CloseButton;
  Dropdown: typeof Dropdown;
  ExternalLink: typeof ExternalLink;
  FileType: typeof FileType;
  Flyout: typeof Flyout;
  Heading: typeof Heading;
  ListFilter: typeof ListFilter;
  ListGroup: typeof ListGroup;
  Loader: typeof Loader;
  Main: typeof Main;
  Modal: typeof Modal;
  Nav: typeof Nav;
  Placeholder: typeof Placeholder;
  PropertyList: typeof PropertyList;
  Skeleton: typeof Skeleton;
  StatCard: typeof StatCard;
  Subheading: typeof Subheading;
  Table: typeof Table;
  Toast: typeof Toast;

  'Aside::Item': typeof AsideItem;

  'Dropdown::Item': typeof DropdownItem;
  'Dropdown::Divider': typeof DropdownDivider;

  'Form::Check': typeof FormCheck;
  'Form::DateInput': typeof FormDateInput;
  'Form::Error': typeof FormError;
  'Form::FileInput': typeof FormFileInput;
  'Form::Help': typeof FormHelp;
  'Form::Input': typeof FormInput;
  'Form::Label': typeof FormLabel;
  'Form::PhoneInput': typeof FormPhoneInput;
  'Form::RadioButton': typeof FormRadioButton;
  'Form::RadioCard': typeof FormRadioCard;
  'Form::Radio': typeof FormRadio;
  'Form::Select': typeof FormSelect;
  'Form::Textarea': typeof FormTextarea;

  'Main::Body': typeof MainBody;
  'Main::Footer': typeof MainFooter;
  'Main::Header': typeof MainHeader;
  'Main::TopHeader': typeof MainTopHeader;

  'PropertyList::Item': typeof PropertyListItem;

  'file-size': typeof fileSize;
  'from-now': typeof fromNow;
  timestamp: typeof timestamp;
}