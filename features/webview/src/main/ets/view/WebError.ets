/**
 * @file WebError.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-11
 * @desc
 */

// system

// module

// view

// model

// viewmodel

// tools
import { Constants } from '../common/Constants'

// logic


@Component
export struct WebError {
  handleReload?: () => void;

  build() {
    Row() {
      Column() {
        Image($r('app.media.ic_failure'))
          .width($r('app.float.failure_img_size'))
          .height($r('app.float.failure_img_size'))
        Text($r('app.string.load_failed'))
          .fontColor($r('app.color.reload_title_color'))
          .fontSize($r('app.float.normal_text_size'))
          .margin({ top: $r('app.float.padding_margin') })
        Row() {
          Text($r('app.string.reload'))
            .fontColor($r('app.color.main_red_color'))
            .fontSize($r('app.float.small_text_size'))
            .width(Constants.FULL_PERCENT)
            .textAlign(TextAlign.Center)
        }
        .height($r('app.float.reload_btn_height'))
        .width($r('app.float.reload_btn_width'))
        .margin({ top: $r('app.float.padding_margin') })
        .borderWidth(1)
        .borderColor($r('app.color.main_red_color'))
        .borderRadius($r('app.float.border_radius'))
        .onClick(() => this.handleReload?.())
      }
    }
    .justifyContent(FlexAlign.Center)
    .layoutWeight(1)
  }
}