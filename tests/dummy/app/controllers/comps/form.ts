import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import type {
  OptGroup,
  Option,
} from '@trusted-american/design-system/components/form/select';

export default class CompsFormController extends Controller {
  check = false;
  date: Date | null = new Date();
  file?: unknown;
  htmlValue: string | null = null;
  phone?: string | null | undefined;
  radio?: unknown;
  value?: string | null | undefined;
  status?: 'active' | 'inactive';
  number: number | null = null;
  city?: string;

  @tracked default: Option<string> = {
    value: 'undefined',
    label: 'Choose…',
  };

  @tracked group1: OptGroup<string> = {
    groupName: 'Norcal',
    options: [
      { label: 'Sacramento', value: 'Sacramento' },
      { label: 'Roseville', value: 'Roseville' },
      { label: 'Davis', value: 'Davis' },
    ] as Option<string>[],
  };

  @tracked group2: OptGroup<string> = {
    groupName: 'Socal',
    options: [
      { label: 'Los Angeles', value: 'Los Angeles' },
      { label: 'Pomona', value: 'Pomona' },
      { label: 'Temecula', value: 'Temecula' },
    ] as Option<string>[],
  };

  @tracked option1: Option<string> = {
    label: 'Midcal',
    value: 'Bakersfield',
  };

  @tracked groupOptions: (OptGroup<string> | Option<string>)[] = [
    this.default,
    this.group1,
    this.group2,
    this.option1,
  ];

  @action
  create() {}
}
