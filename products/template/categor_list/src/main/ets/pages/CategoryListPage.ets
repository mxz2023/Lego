import { CommonConstants } from '../constants/CommonConstants';
import { Category } from '../viewmodel/Category';
import { CategoryComponent } from '../view/CategoryComponent';
import PageViewModel from '../viewmodel/PageViewModel';

/**
 * The CategoryListPage is the entry of application and shows how to develop a basic category list.
 * The page contains title, Search and CategoryComponent which consists of several categories. The items in the
 * category are incremented, from one to six.
 * Developers can modify or add own text and images, and quickly develop functions that meet project requirements.
 */
@Entry
@Component
struct CategoryListPage {
  build() {
    Column() {
      GridRow({
        breakpoints: {
          value: CommonConstants.BREAK_POINTS_VALUE,
          reference: BreakpointsReference.WindowSize
        },
        columns: {
          sm: CommonConstants.COLUMNS_SM,
          md: CommonConstants.COLUMNS_MD,
          lg: CommonConstants.COLUMNS_LG
        },
        gutter: { x: CommonConstants.GUTTER_X },
        direction: GridRowDirection.Row
      }) {
        GridCol({
          span: {
            sm: CommonConstants.SPAN_SM,
            md: CommonConstants.SPAN_MD,
            lg: CommonConstants.SPAN_LG
          },
          offset: {
            md: CommonConstants.OFFSET_MD,
            lg: CommonConstants.OFFSET_LG
          }
        }) {
          Column() {
            this.Title()

            Search({
              placeholder: CommonConstants.SEARCH_PLACEHOLDER
            })
              .height($r('app.float.search_height'))
              .border({ radius: $r('app.float.search_radius') })
              .placeholderColor($r('app.color.search_placeholder'))
              .placeholderFont({
                size: $r('app.float.search_text_size'),
                weight: CommonConstants.SEARCH_WEIGHT,
                family: CommonConstants.SEARCH_FONT_FAMILY,
                style: FontStyle.Normal
              })
              .textFont({ size: $r('app.float.search_text_size') })
              .margin({
                top: $r('app.float.search_margin_top'),
                bottom: $r('app.float.search_margin_bottom')
              })

            Scroll() {
              Column() {
                ForEach(PageViewModel.getCategoryData(), (category: Category) => {
                  Text(category.title)
                    .fontSize($r('app.float.sub_title_size'))
                    .fontColor($r('app.color.list_item_summary'))
                    .height($r('app.float.sub_title_height'))
                    .margin({ left: $r('app.float.sub_title_margin_left') })
                    .align(Alignment.BottomStart)
                    .padding({ bottom: $r('app.float.text_padding_bottom') })

                  CategoryComponent({ listData: category.categoryContent })
                }, (category: Category, index?: number) => index + JSON.stringify(category))
              }
              .alignItems(HorizontalAlign.Start)
            }
            .edgeEffect(EdgeEffect.Spring)
            .margin({
              top: $r('app.float.scroll_bottom_margin_top')
            })
            .layoutWeight(CommonConstants.SCROLL_WEIGHT)
          }
        }
      }
      .margin({
        left: $r('app.float.grid_row_margin_left'),
        right: $r('app.float.grid_row_margin_right')
      })
    }
    .backgroundColor($r('app.color.theme_background'))
  }

  @Builder Title() {
    Row() {
      Text($r('app.string.page_title'))
        .fontColor($r('app.color.page_title'))
        .fontSize($r('app.float.title_font_size'))
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height($r('app.float.title_height'))
    .margin({
      top: $r('app.float.title_margin_top'),
      left:$r('app.float.title_margin_left')
    })
  }
}