import { CommonConstants } from '../constants/CommonConstants';
import { Category } from './Category';
import { DataItem } from './DataItem';

/**
 * Category list page view model.
 */
class PageViewModel {
  /**
   * Get category data.
   *
   * @return {Array<Category>} categoryData
   */
  getCategoryData(): Array<Category> {
    let categoryData: Array<Category> = [];
    for (let i = 0; i < CommonConstants.CATEGORY_CONTENT_LIST_SIZE; i++) {
      let categoryItem = new Category();
      categoryItem.title = $r('app.string.sub_title');
      categoryItem.categoryContent = this.getListData(i + CommonConstants.CATEGORY_INCREMENTAL_STEP);
      categoryData.push(categoryItem);
    }
    return categoryData;
  }

  /**
   * Get sub list data in a category.
   *
   * @param {number} itemSize The size of listData of category.
   * @return {Array<DataItem>} ListData of category.
   */
  private getListData(itemSize: number): Array<DataItem> {
    let listData: Array<DataItem> = [];
    for (let i = 0; i < itemSize; i++) {
      let listItem = new DataItem();
      listItem.title = $r('app.string.list_item_title');
      listItem.summary = $r('app.string.list_item_summary');
      listItem.imageArrow = $r('app.media.ic_right_arrow');
      listData.push(listItem);
    }
    return listData;
  }

  /**
   * Get list data in detail page.
   *
   * @return {Array<DataItem>} detailData
   */
  getDetailData(): Array<DataItem> {
    let detailData: Array<DataItem> = [];
    for (let i = 0; i < CommonConstants.DETAIL_PAGE_LIST_SIZE; i++) {
      let detailItem = new DataItem();
      detailItem.title = $r('app.string.page_title');
      detailItem.summary = $r('app.string.list_item_summary');
      detailData.push(detailItem);
    }
    return detailData;
  }
}

let pageViewModel = new PageViewModel();

export default pageViewModel as PageViewModel;