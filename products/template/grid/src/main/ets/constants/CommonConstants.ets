/**
 * Common constants for all features.
 */
export class CommonConstants {
  /**
   * Top grid count.
   */
  static readonly TOP_GRID_COUNT: number = 8;

  /**
   * Bottom grid count.
   */
  static readonly BOTTOM_GRID_COUNT: number = 32;

  /**
   * Font weight of text in Grid.
   */
  static readonly GRID_ITEM_FONT_WEIGHT: number = 400;

  /**
   * Font weight of text.
   */
  static readonly TEXT_FONT_WEIGHT: number = 500;

  /**
   * Font weight of title.
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * Layout weight of scroll.
   */
  static readonly SCROLL_LAYOUT_WEIGHT: number = 1;

  /**
   * Number of Column of the Multi-Device Gridrow Component in an SM Breakpoint.
   */
  static readonly COLUMN_SM: number = 4;

  /**
   * Number of Column of the Multi-Device Gridrow Component in an MD Breakpoint.
   */
  static readonly COLUMN_MD: number = 8;

  /**
   * Number of Column of the Multi-Device Gridrow Component in an LG Breakpoint.
   */
  static readonly COLUMN_LG: number = 12;

  /**
   * Multi-device GridCol component span under SM breakpoints.
   */
  static readonly SPAN_SM: number = 4;

  /**
   * Multi-device GridCol component span under MD breakpoints.
   */
  static readonly SPAN_MD: number = 8;

  /**
   * Multi-device GridCol component span under LG breakpoints.
   */
  static readonly SPAN_LG: number = 8;

  /**
   * Offset of the Multi-Device GridCol Component under LG Breakpoint.
   */
  static readonly OFFSET_LG: number = 2;

  /**
   * Height of a grid row.
   */
  static readonly GRID_ROW_HEIGHT: number = 72;

  /**
   * Grid column template in default screen.
   */
  static readonly FOUR_COLUMN_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * Grid column template in widescreen.
   */
  static readonly EIGHT_COLUMN_TEMPLATE: string = '1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr';

  /**
   * Multi device break points.
   */
  static readonly BREAK_POINT: Array<string> = ['320vp', '600vp', '840vp'];
  /**
   * Breakpoint xs.
   */
  static readonly BREAK_POINT_XS: string = 'xs';

  /**
   * Breakpoint sm.
   */
  static readonly BREAK_POINT_SM: string = 'sm';

  /**
   * Breakpoint md.
   */
  static readonly BREAK_POINT_MD: string = 'md';

  /**
   * Breakpoint lg.
   */
  static readonly BREAK_POINT_LG: string = 'lg';

  /**
   * Full percent of the width.
   */
  static readonly FULL_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of the grid page height.
   */
  static readonly GRID_PAGE_HEIGHT_PERCENT: string = '100%';

  /**
   * Percent of the text width.
   */
  static readonly TEXT_WIDTH_PERCENT: string = '100%';
}