import { WidgetType } from './WidgetType';

/**
 * Data item data entity.
 */
export class DataItem {
  /**
   * List item title.
   */
  title: Resource = $r('app.string.list_item_title');

  /**
   * List item sub title.
   */
  subTitle: Resource = $r('app.string.list_item_sub_title');

  /**
   * List item widget type.
   */
  widget: WidgetType = WidgetType.TOGGLE;
}