import { TabItem } from './TabItem';
import { DataItem } from './DataItem';
import { CommonConstants } from '../constants/CommonConstants';
import { WidgetType } from './WidgetType';

/**
 * BusinessCard ability view model.
 */
class BusinessViewModel {
  /**
   * Get list items.
   *
   * @return {Array<DataItem>} listItems.
   */
  getDataItems(): Array<DataItem> {
    let widgets: Array<WidgetType> = [WidgetType.TOGGLE, WidgetType.INFO, WidgetType.TEXT, WidgetType.default];
    let dataItems: Array<DataItem> = [];
    for (let i = 0; i < widgets.length; i++) {
      for (let j = 0; j < CommonConstants.REPEAT_TIMES; j++) {
        let cardItem = new DataItem();
        cardItem.title = $r('app.string.list_item_title');
        cardItem.subTitle = $r('app.string.list_item_sub_title');
        cardItem.widget = widgets[i];
        dataItems.push(cardItem);
      }
    }
    return dataItems;
  }

  /**
   * Get tab items of businessCard page.
   *
   * @return {Array<TabItem>} menuItems.
   */
  getTabItems(): Array<TabItem> {
    let tabItems: Array<TabItem> = [];
    for (let i = 0; i < CommonConstants.TAB_SIZE; i++) {
      let tabItem = new TabItem();
      tabItem.index = i;
      tabItem.imageOriginal = $r('app.media.ic_tab_normal');
      tabItem.imageActivated = $r('app.media.ic_tab_activated');
      tabItem.title = $r('app.string.tab_title');
      tabItems.push(tabItem);
    }
    return tabItems;
  }

  /**
   * Get detail page list items.
   *
   * @return {Array<DataItem>} detailListItems.
   */
  getDetailPageDataItems(): Array<DataItem> {
    let detailListItems: Array<DataItem> = [];
    for (let i = 0; i < CommonConstants.DETAIL_LIST_SIZE; i++) {
      let dataItem = new DataItem();
      dataItem.title = $r('app.string.list_item_title');
      dataItem.subTitle = $r('app.string.list_item_sub_title');
      detailListItems.push(dataItem);
    }
    return detailListItems;
  }
}

let businessViewModel = new BusinessViewModel();

export default businessViewModel as BusinessViewModel;