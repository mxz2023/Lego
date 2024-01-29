import { DataItem } from './DataItem';

/**
 * Category item information.
 */
export class Category {

  /**
   * Category title.
   */
  title: Resource = $r('app.string.sub_title');

  /**
   * Category content(a list).
   */
  categoryContent: Array<DataItem> = [];
}