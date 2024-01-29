import router from '@ohos.router';
import { CommonConstants } from '../constants/CommonConstants';
import { GridAreaComponent } from '../view/GridAreaComponent';
import GridViewModel from '../viewmodel/GridViewModel';

/**
 * This module template implements Grid functions.
 * The template structure is from top to bottom,include Grid and Text.
 * Developers can add corresponding data as needed after creating a template.
 */
@Entry
@Component
struct GridPage {
  build() {
    Column() {
      this.Title()

      Scroll() {
        Column() {
          GridAreaComponent({ gridAreaContent: GridViewModel.getTopGridAreaData(), isShowTitle: false})

          GridAreaComponent({ gridAreaContent: GridViewModel.getBottomGridAreaData(), isShowTitle: true })
        }
        .padding({
          left: $r('app.float.grid_row_margin_left'),
          right: $r('app.float.grid_row_margin_right')
        })
      }
      .scrollBar(BarState.Off)
      .layoutWeight(CommonConstants.SCROLL_LAYOUT_WEIGHT)
    }
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.grid_background'))
    .height(CommonConstants.GRID_PAGE_HEIGHT_PERCENT)
    .padding({
      bottom: $r('app.float.grid_page_padding_bottom')
    })
  }

  @Builder Title() {
    Row() {
      Image($r('app.media.ic_back'))
        .width($r('app.float.image_size'))
        .height($r('app.float.image_size'))
        .margin({
          left: $r('app.float.image_margin_left'),
          right: $r('app.float.image_margin_right')
        })
        .onClick(() => {
          router.back();
        })

      Text($r('app.string.title'))
        .height($r('app.float.text_title_height'))
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height($r('app.float.title_height'))
  }
}