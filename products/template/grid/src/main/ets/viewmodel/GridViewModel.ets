import { CommonConstants } from '../constants/CommonConstants';
import { DataItem } from './DataItem';
import { GridAreaContent } from './GridAreaContent';

/**
 * Get the app index in bundleInfoList.
 */
export class GridViewModel {
  /**
   * Get the grid items.
   *
   * @param {number} dataCount
   * @return {Array<DataItem>} gridItems
   */
  private getGridItems(dataCount: number): Array<DataItem> {
    let gridItems: Array<DataItem> = [];
    for (let index = 0; index < dataCount; index++) {
      let gridItem = new DataItem();
      gridItem.image = $r('app.media.ic_grid_item');
      gridItem.title = $r('app.string.grid_item_text');
      gridItems.push(gridItem);
    }
    return gridItems;
  }

  /**
   * Get top grid area data.
   *
   * @return {GridAreaContent} gridAreaContents
   */
  getTopGridAreaData(): GridAreaContent {
    let gridAreaContent = new GridAreaContent();
    gridAreaContent.gridItems = this.getGridItems(CommonConstants.TOP_GRID_COUNT);
    return gridAreaContent;
  }

  /**
   * Get bottom grid area data.
   *
   * @return {GridAreaContent} gridAreaContents
   */
  getBottomGridAreaData(): GridAreaContent {
    let gridAreaContent = new GridAreaContent();
    gridAreaContent.gridItems = this.getGridItems(CommonConstants.BOTTOM_GRID_COUNT);
    return gridAreaContent;
  }
}

let gridViewModel = new GridViewModel();

export default gridViewModel as GridViewModel;