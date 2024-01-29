import router from '@ohos.router';
import { CommonConstants } from '../constants/CommonConstants';
import { DataItem } from '../viewmodel/DataItem';

/**
 * This is the list of category item.
 */
@Component
export struct CategoryComponent {
  private listData: Array<DataItem> = [];

  build() {
    Column() {
      List() {
        ForEach(this.listData, (dataItem: DataItem) => {
          ListItem() {
            Row() {
              Text(dataItem.title)
                .fontSize($r('app.float.sub_title_left_size'))
                .fontColor($r('app.color.list_item_title'))
                .margin({ left: $r('app.float.item_text_margin_left') })
              Blank();
              Text(dataItem.summary)
                .fontSize($r('app.float.sub_title_right_size'))
                .fontColor($r('app.color.list_item_summary'))
                .margin({ right: $r('app.float.item_text_margin_right') })
              Image(dataItem.imageArrow)
                .width($r('app.float.image_right_arrow_width'))
                .height($r('app.float.image_right_arrow_height'))
                .objectFit(ImageFit.Contain)
                .margin({ right: $r('app.float.sub_item_margin_right') })
            }
            .width(CommonConstants.ROW_WIDTH_PERCENT)
            .height($r('app.float.list_item_height'))
            .onClick(() => {
              router.pushUrl({
                url: CommonConstants.DETAIL_PAGE,
                params: {
                  data: dataItem.title
                }
              });
            })
          }
        }, (dataItem: DataItem, index?: number) => index + JSON.stringify(dataItem));
      }
      .divider({
        strokeWidth: $r('app.float.divider_height'),
        color: $r('app.color.list_divider'),
        startMargin: $r('app.float.list_divider_margin'),
        endMargin: $r('app.float.list_divider_margin')
      })
    }
    .padding({
      top: $r('app.float.list_padding_top'),
      bottom: $r('app.float.list_padding_bottom')
    })
    .backgroundColor($r('app.color.start_window_background'))
    .borderRadius($r('app.float.detail_list_radius'))
  }
}