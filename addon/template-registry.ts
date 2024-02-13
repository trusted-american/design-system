import type Accordion from './components/accordion';
import type Alert from './components/alert';
import type Aside from './components/aside';
import type Avatar from './components/avatar';
import type Badge from './components/badge';
import type BreadcrumbTrail from './components/breadcrumb-trail';
import type Button from './components/button';
import type ButtonSet from './components/button-set';
import type Calendar from './components/calendar';
import type Card from './components/card';
import type CloseButton from './components/close-button';
import type Dropdown from './components/dropdown';
import type ExternalLink from './components/external-link';
import type FileType from './components/file-type';
import type Flyout from './components/flyout';
import type Heading from './components/heading';
import type Icon from './components/icon';
import type ListFilter from './components/list-filter';
import type ListGroup from './components/list-group';
import type Loader from './components/loader';
import type Main from './components/main';
import type Modal from './components/modal';
import type Nav from './components/nav';
import type Pagination from './components/pagination';
import type Placeholder from './components/placeholder';
import type Progress from './components/progress';
import type PropertyList from './components/property-list';
import type Skeleton from './components/skeleton';
import type StatCard from './components/stat-card';
import type Subheading from './components/subheading';
import type Table from './components/table';
import type Toast from './components/toast';

import type AccordionBody from './components/accordion/body';
import type AccordionButton from './components/accordion/button';
import type AccordionItem from './components/accordion/item';

import type AsideItem from './components/aside/item';
import type AsideTitle from './components/aside/title';

import type DropdownDivider from './components/dropdown/divider';
import type DropdownHeader from './components/dropdown/header';
import type DropdownItem from './components/dropdown/item';

import type FormCheck from './components/form/check';
import type FormDateInput from './components/form/date-input';
import type FormError from './components/form/error';
import type FormFileInput from './components/form/file-input';
import type FormHelp from './components/form/help';
import type FormInput from './components/form/input';
import type FormLabel from './components/form/label';
import type FormNumberInput from './components/form/number-input';
import type FormPhoneInput from './components/form/phone-input';
import type FormRadioButton from './components/form/radio-button';
import type FormRadioCard from './components/form/radio-card';
import type FormRadio from './components/form/radio';
import type FormSelect from './components/form/select';
import type FormTextarea from './components/form/textarea';
import type FormTimeInput from './components/form/time-input';

import type ListGroupItem from './components/list-group/item';

import type MainBody from './components/main/body';
import type MainFooter from './components/main/footer';
import type MainHeader from './components/main/header';
import type MainTopHeader from './components/main/top-header';

import type ProgressBar from './components/progress/bar';

import type PropertyListItem from './components/property-list/item';

import type fileSize from './helpers/file-size';
import type fromNow from './helpers/from-now';
import type timestamp from './helpers/timestamp';

import type tdsDropdown from './modifiers/tds-dropdown';
import type tdsTooltip from './modifiers/tds-tooltip';

export default interface Registry {
  Accordion: typeof Accordion;
  Alert: typeof Alert;
  Aside: typeof Aside;
  Avatar: typeof Avatar;
  Badge: typeof Badge;
  BreadcrumbTrail: typeof BreadcrumbTrail;
  Button: typeof Button;
  ButtonSet: typeof ButtonSet;
  Calendar: typeof Calendar;
  Card: typeof Card;
  CloseButton: typeof CloseButton;
  Dropdown: typeof Dropdown;
  ExternalLink: typeof ExternalLink;
  FileType: typeof FileType;
  Flyout: typeof Flyout;
  Heading: typeof Heading;
  Icon: typeof Icon;
  ListFilter: typeof ListFilter;
  ListGroup: typeof ListGroup;
  Loader: typeof Loader;
  Main: typeof Main;
  Modal: typeof Modal;
  Nav: typeof Nav;
  Pagination: typeof Pagination;
  Placeholder: typeof Placeholder;
  Progress: typeof Progress;
  PropertyList: typeof PropertyList;
  Skeleton: typeof Skeleton;
  StatCard: typeof StatCard;
  Subheading: typeof Subheading;
  Table: typeof Table;
  Toast: typeof Toast;

  'Accordion::Body': typeof AccordionBody;
  'Accordion::Button': typeof AccordionButton;
  'Accordion::Item': typeof AccordionItem;

  'Aside::Item': typeof AsideItem;
  'Aside::Title': typeof AsideTitle;

  'Dropdown::Divider': typeof DropdownDivider;
  'Dropdown::Header': typeof DropdownHeader;
  'Dropdown::Item': typeof DropdownItem;

  'Form::Check': typeof FormCheck;
  'Form::DateInput': typeof FormDateInput;
  'Form::Error': typeof FormError;
  'Form::FileInput': typeof FormFileInput;
  'Form::Help': typeof FormHelp;
  'Form::Input': typeof FormInput;
  'Form::Label': typeof FormLabel;
  'Form::NumberInput': typeof FormNumberInput;
  'Form::PhoneInput': typeof FormPhoneInput;
  'Form::RadioButton': typeof FormRadioButton;
  'Form::RadioCard': typeof FormRadioCard;
  'Form::Radio': typeof FormRadio;
  'Form::Select': typeof FormSelect;
  'Form::Textarea': typeof FormTextarea;
  'Form::TimeInput': typeof FormTimeInput;

  'ListGroup::Item': typeof ListGroupItem;

  'Main::Body': typeof MainBody;
  'Main::Footer': typeof MainFooter;
  'Main::Header': typeof MainHeader;
  'Main::TopHeader': typeof MainTopHeader;

  'Progress::Bar': typeof ProgressBar;

  'PropertyList::Item': typeof PropertyListItem;

  'file-size': typeof fileSize;
  'from-now': typeof fromNow;
  timestamp: typeof timestamp;

  'tds-dropdown': typeof tdsDropdown;
  'tds-tooltip': typeof tdsTooltip;
}
