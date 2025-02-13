import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

interface Post {
  subject: string;
  body: string;
}

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
  status?: 'active' | 'inactive' | 'third' | 'fourth';
  numberValue: number | null = null;
  objectValue?: Post;
  arrayValue: Post[] = [];

  @action
  create(file: File) {
    this.files = [...this.files, file];
  }
}
