import router from '@ohos.router';
import { CommonConstants } from '../constants/CommonConstants';
import { HeaderComponent } from '../view/HeaderComponent';

/**
 * Page shows registration successful.
 */
@Entry
@Component
struct RegistrationSuccessPage {
  build() {
    Column() {
      HeaderComponent({ title: $r('app.string.register_success_text') })

      Scroll() {
        Column() {
          Image($r("app.media.ic_registration_success"))
            .objectFit(ImageFit.Contain)
            .width($r('app.float.registration_success_logo_width'))
            .height($r('app.float.registration_success_logo_height'))

          Text($r('app.string.register_success_text'))
            .width($r('app.float.register_success_text_width'))
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.register_success_text_font_size'))
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })

          Text($r('app.string.jump_mine_page_text'))
            .width($r('app.float.jump_mine_page_text_width'))
            .height($r('app.float.jump_mine_page_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.jump_text_font_size'))
            .fontColor($r('app.color.jump_text_font'))
            .onClick(() => {
              router.replaceUrl({
                url: CommonConstants.MINE_PAGE_URL
              });
            })
        }
        .width(CommonConstants.REGISTRATION_PAGE_WIDTH_PERCENT)
        .height(CommonConstants.REGISTRATION_PAGE_HEIGHT_PERCENT)
        .justifyContent(FlexAlign.Center)
      }
      .layoutWeight(CommonConstants.SCROLL_LAYOUT_WEIGHT)
    }
  }
}