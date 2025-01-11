import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class CompsFormController extends Controller {
  check = false;
  date: Date | null = new Date();
  @tracked files: File[] = [];
  file?: File;
  htmlValue: string | null = null;
  markdownValue: string | null = null;
  phone?: string | null | undefined;
  radio?: boolean;
  value?: string | null | undefined;
  status?: 'active' | 'inactive';
  numberValue: number | null = null;

  @action
  create(file: File) {
    this.files = [...this.files, file];
  }
}
