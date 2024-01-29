/**
 * Tab item info.
 */
export class TabItem {
  /**
   * Tab item index.
   */
  index: number = 0;

  /**
   * Tab item title.
   */
  title: Resource = $r('app.string.tab_text');

  /**
   * Image activated.
   */
  imageActivated: Resource = $r('app.media.ic_tab_normal');

  /**
   * Image original.
   */
  imageOriginal: Resource = $r('app.media.ic_tab_activated');
}