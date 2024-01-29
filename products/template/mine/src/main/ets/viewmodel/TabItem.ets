/**
 * Menu item data entity.
 */
export class TabItem {
  /**
   * Tab index.
   */
  index: number = 0;

  /**
   * Tab original icon.
   */
  imageOriginal: Resource = $r('app.media.ic_tab_normal');

  /**
   * Tab activated icon.
   */
  imageActivated: Resource = $r('app.media.ic_tab_activated');

  /**
   * Tab title.
   */
  title: Resource = $r('app.string.tab_title');
}