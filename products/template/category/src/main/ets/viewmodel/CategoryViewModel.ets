import { CommonConstants } from '../constants/CommonConstants';
import { SideListItem } from './SideListItem';
import { TabItem } from './TabItem';
import { DetailListItem } from './DetailListItem';
import { DetailItem } from './DetailItem';

/**
 * Category ability view model.
 */
export class CategoryViewModel {
  /**
   * Get index list data on the left.
   *
   * @return {Array<IndexListItem>} indexListItems
   */
  getSideListData(): Array<SideListItem> {
    let indexListItems: Array<SideListItem> = [];
    for (let index = 1; index <= CommonConstants.LIST_SIZE; index++) {
      let indexListItem = new SideListItem();
      indexListItem.title = $r('app.string.list_item_text', index);
      indexListItems.push(indexListItem);
    }
    return indexListItems;
  }

  /**
   * Get tab item data.
   *
   * @return {Array<TabItem>} tabItems
   */
  getTabItems(): Array<TabItem> {
    let tabItems: Array<TabItem> = [];
    for (let index = 0; index < CommonConstants.TAB_BAR_SIZE; index++) {
      let tabItem = new TabItem();
      tabItem.index = index;
      tabItem.title = $r('app.string.tab_text');
      tabItem.imageOriginal = $r('app.media.ic_tab_normal');
      tabItem.imageActivated = $r('app.media.ic_tab_activated');
      tabItems.push(tabItem);
    }
    return tabItems;
  }

  /**
   * Get detail list item info.
   *
   * @return {Array<DetailListItem>} detailListItems
   */
  getDetailListItems(): Array<DetailListItem> {
    let detailListItems: Array<DetailListItem> = [];
    for (let index = 0; index < CommonConstants.LIST_SIZE; index++) {
      let detailListItem = new DetailListItem();
      detailListItem.index = index;
      detailListItem.title = $r('app.string.detail_list_item_text');
      detailListItem.detailItemData = this.getDetailItems();
      detailListItems.push(detailListItem);
    }
    return detailListItems;
  }

  /**
   * Get detail item info.
   *
   * @return {Array<DetailItem>} gridData
   */
  private getDetailItems(): Array<DetailItem> {
    let detailData: Array<DetailItem> = [];
    for (let index = 0; index < CommonConstants.DETAIL_ITEM_SIZE; index++) {
      let detailItem = new DetailItem();
      detailItem.content = $r('app.string.grid_item_text');
      detailData.push(detailItem);
    }
    return detailData;
  }
}

let categoryViewModel = new CategoryViewModel();

export default categoryViewModel as CategoryViewModel;