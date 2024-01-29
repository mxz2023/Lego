import { DetailItem } from './DetailItem';

/**
 * Detail list item info.
 */
export class DetailListItem {
  /**
   * Detail list item index.
   */
  index: number = 0;

  /**
   * Detail list item title.
   */
  title: Resource = $r('app.string.detail_list_item_text');

  /**
   * Detail list item data.
   */
  detailItemData: Array<DetailItem> = [];
}