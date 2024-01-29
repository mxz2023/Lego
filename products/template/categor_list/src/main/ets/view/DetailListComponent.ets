import { CommonConstants } from '../constants/CommonConstants';
import { DataItem } from '../viewmodel/DataItem';
import CategoryModel from '../viewmodel/PageViewModel';

/**
 * This is the general detail page component that can add multiple items to the list.
 */
@Component
export struct DetailListComponent {
  build() {
    Column() {
      List() {
        ForEach(CategoryModel.getDetailData(), (dataItem: DataItem) => {
          ListItem() {
            Row() {
              Text(dataItem.title)
                .fontSize($r('app.float.sub_title_left_size'))
                .fontColor($r('app.color.list_item_title'))
              Blank()
              Text(dataItem.summary)
                .fontSize($r('app.float.sub_title_right_size'))
                .fontColor($r('app.color.list_item_summary'))
            }
            .width(CommonConstants.ROW_WIDTH_PERCENT)
            .height($r('app.float.list_item_height'))
          }
        }, (dataItem: DataItem, index?: number) => index + JSON.stringify(dataItem));
      }
      .divider({
        strokeWidth: $r('app.float.divider_height'),
        color: $r('app.color.list_divider')
      })
    }
    .padding({
      top: $r('app.float.list_padding_top'),
      bottom: $r('app.float.list_padding_bottom'),
      left: $r('app.float.column_margin_left'),
      right: $r('app.float.column_margin_right')
    })
    .margin({ top: $r('app.float.list_margin_top') })
    .backgroundColor($r('app.color.start_window_background'))
    .borderRadius($r('app.float.detail_list_radius'))
  }
}