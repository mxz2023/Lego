import { CommonConstants } from '../constants/CommonConstants';
import { DetailListItem } from '../viewmodel/DetailListItem';
import { DetailItem } from '../viewmodel/DetailItem';
import CategoryViewModel from '../viewmodel/CategoryViewModel';

/**
 * Category detail list component.
 */
@Component
export struct DetailListComponent {
  scroller: Scroller = new Scroller();
  @Prop detailListBreakpoint: string = '';
  @Link sideListIndex: number;

  build() {
    List({ scroller: this.scroller }) {
      ForEach(CategoryViewModel.getDetailListItems(), (item: DetailListItem) => {
        ListItem() {
          CategoryListItem({
            detailListItem: item,
            currentBreakpoint: this.detailListBreakpoint
          })
        }
      }, (item: DetailListItem, index?: number) => index + JSON.stringify(item))
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .onScrollIndex((firstIndex: number) => {
      this.sideListIndex = firstIndex;
    })
  }
}

@Component
struct CategoryListItem {
  private detailListItem: DetailListItem = new DetailListItem();
  @Prop currentBreakpoint: string = '';

  build() {
    Column() {
      Text(this.detailListItem.title)
        .height($r('app.float.detail_list_text_height'))
        .fontSize($r('app.float.detail_list_text_size'))
        .fontColor($r('app.color.list_item_text'))
        .fontWeight(CommonConstants.DETAIL_LIST_FONT_WEIGHT)
        .align(Alignment.Start)

      Grid() {
        ForEach(this.detailListItem.detailItemData, (item: DetailItem) => {
          GridItem() {
            Text(item.content)
              .width(CommonConstants.FULL_WIDTH_PERCENT)
              .height($r('app.float.detail_list_item_height'))
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.Grid_item_text_size'))
              .fontWeight(CommonConstants.TAB_ITEM_FONT_WEIGHT)
              .align(Alignment.Center)
              .borderRadius($r('app.float.grid_item_radius'))
              .backgroundColor($r('app.color.grid_text_background'))
          }
        }, (item: DetailItem, index?: number) => index + JSON.stringify(item))
      }
      .columnsTemplate(this.currentBreakpoint === CommonConstants.BREAK_POINT_SM ?
        CommonConstants.GRID_TEMPLATE_TWO : CommonConstants.GRID_TEMPLATE_THREE)
      .rowsTemplate(this.currentBreakpoint === CommonConstants.BREAK_POINT_SM ?
        CommonConstants.GRID_TEMPLATE_THREE : CommonConstants.GRID_TEMPLATE_TWO)
      .columnsGap(this.currentBreakpoint === CommonConstants.BREAK_POINT_SM ?
        CommonConstants.GRID_COLUMNS_GAP_SM : CommonConstants.GRID_COLUMNS_GAP_NORMAL)
      .height(this.currentBreakpoint === CommonConstants.BREAK_POINT_SM ?
        $r('app.float.detail_list_item_height_xs') : $r('app.float.detail_list_item_height_normal'))
    }
    .height(this.currentBreakpoint === CommonConstants.BREAK_POINT_SM ?
      $r('app.float.detail_list_height_xs') : $r('app.float.detail_list_height_normal'))
    .alignItems(HorizontalAlign.Start)
  }
}

