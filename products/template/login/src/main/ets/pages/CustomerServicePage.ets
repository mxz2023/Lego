import { CommonConstants } from '../constants/CommonConstants';
import { CustomerListComponent } from '../view/CustomerListComponent';
import { HeaderComponent } from '../view/HeaderComponent';

/**
 * Customer service page. Click the help button to jump to the CustomerServicePage.
 */
@Entry
@Component
struct CustomerServicePage {
  build() {
    Column() {
      HeaderComponent({ title: $r('app.string.contact_customer_service') })

      GridRow({
        breakpoints: {
          value: CommonConstants.BREAK_POINT,
          reference: BreakpointsReference.WindowSize
        },
        columns: {
          sm: CommonConstants.GRID_ROW_SM,
          md: CommonConstants.GRID_ROW_MD,
          lg: CommonConstants.GRID_ROW_LG
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
          CustomerListComponent()
        }
      }
      .margin({
        left: $r('app.float.customer_margin_left'),
        right: $r('app.float.customer_margin_right')
      })
    }
    .width(CommonConstants.CUSTOMER_COLUMN_WIDTH_PERCENT)
    .height(CommonConstants.CUSTOMER_COLUMN_HEIGHT_PERCENT)
    .backgroundColor($r('app.color.detail_background'))
  }
}
