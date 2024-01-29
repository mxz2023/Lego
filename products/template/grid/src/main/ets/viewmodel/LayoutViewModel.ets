import { CommonConstants } from '../constants/CommonConstants';
/**
 * Grid area component model.
 */
export class LayoutViewModel {
  /**
   * Obtains the number of grid columns based on the current breakpoint.
   *
   * @param {currentBreakpoint} Current breakpoint of the device
   */
  private getGridColumns(currentBreakpoint: string): number {
    let gridColumns: number = CommonConstants.COLUMN_SM;
    switch (currentBreakpoint) {
      case CommonConstants.BREAK_POINT_XS:
      case CommonConstants.BREAK_POINT_SM:
        gridColumns = CommonConstants.COLUMN_SM;
        break;

      case CommonConstants.BREAK_POINT_MD:
      case CommonConstants.BREAK_POINT_LG:
        gridColumns = CommonConstants.COLUMN_MD;
        break;
    }
    return gridColumns;
  }

  /**
   * Obtains the Grid Component Columns Template.
   *
   * @param {currentBreakpoint} Current breakpoint of the device
   */
  public getColumnsTemplate(currentBreakpoint: string): string {
    return this.getGridColumns(currentBreakpoint) === CommonConstants.COLUMN_SM
      ? CommonConstants.FOUR_COLUMN_TEMPLATE
      : CommonConstants.EIGHT_COLUMN_TEMPLATE;
  }

  /**
   * Obtains the height of the grid component.
   *
   * @param {gridItemSize} Number of grid component items
   * @param {currentBreakpoint} Current breakpoint of the device
   */
  public getGridHeight(gridItemSize: number, currentBreakpoint: string): string {
    return ((gridItemSize / this.getGridColumns(currentBreakpoint)) * CommonConstants.GRID_ROW_HEIGHT).toString();
  }
}

let layoutViewModel = new LayoutViewModel();

export default layoutViewModel as LayoutViewModel;