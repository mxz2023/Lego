import MediaQueryUtil from '../util/MediaQueryUtil';
import { CommonConstants } from '../constants/CommonConstants';
import { PrivacyStatementComponent } from '../view/PrivacyStatementComponent';
import { LoginComponent } from '../view/LoginComponent';
import { HeaderComponent } from '../view/HeaderComponent';

/**
 * This template implements the Login function.
 * First register personal details. Log in after entering the username and password.
 * Click the button at the bottom to ask for help and check the privacy statement.
 * Developers can save username and password by Preference or Relational Database.
 */
@Entry
@Component
struct LoginPage {
  aboutToAppear() {
    MediaQueryUtil.register();
  }

  aboutToDisappear() {
    MediaQueryUtil.unRegister();
  }

  build() {
    Column() {
      HeaderComponent({ title: $r('app.string.title') })

      Scroll() {
        Column() {
          LoginComponent()

          Blank()

          PrivacyStatementComponent()
        }
        .height(CommonConstants.SCROLL_HEIGHT_PERCENT)
        .constraintSize({ minHeight: $r('app.float.scroll_min_height') })
        .alignItems(HorizontalAlign.Start)
        .padding($r('app.float.login_operation_area_padding'))
      }
      .layoutWeight(CommonConstants.LOGIN_SCROLL_LAYOUT_WEIGHT)
    }
    .width(CommonConstants.LOGIN_PAGE_WIDTH_PERCENT)
    .backgroundColor($r('app.color.login_page_background'))
  }
}