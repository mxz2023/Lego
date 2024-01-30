/**
 * @file WebNavigationBar.ets
 * @author zhongyafeng
 * @crateTime 2024-01-10
 * @desc
 */

// system
import router from '@ohos.router'
import webview from '@ohos.web.webview';

// module

// view

// model

// viewmodel
import * as WebNaviViewModel from '../viewmodel/WebNavigationViewModel'

// tools
import { Constants, ViewZIndex } from '../common/Constants'
import { getStatusBarHeight, getNaviTotalBarHeight } from '../utils/WindowUtil'

// logic



@Builder
function DefaultBuilder() {

}

@Styles
function iconStyle() {
  .width($r('app.float.normal_img_size'))
  .height($r('app.float.normal_img_size'))
}

@Component
export struct WebNavigationBar {

  @Link webViewController: webview.WebviewController;

  @ObjectLink titleData :WebNaviViewModel.WebNaviTitleViewModel
  @ObjectLink leftData :WebNaviViewModel.WebNaviLeftViewModel
  @ObjectLink rightData :WebNaviViewModel.WebNaviRightViewModel
  @ObjectLink backgroundData: WebNaviViewModel.WebNaviBackgroundViewModel

  // 默认返回上一级，及关闭Web容器
  onBackClick: Function = () => {

    // 当历史记录大于1时，返回前一个页面
    if (this.webViewController.accessBackward()) {
      this.webViewController.backward()
      if (this.webViewController.accessBackward()) {
        this.leftData.closeAll = true
      }
    } else {
      router.back()
    }
  }

  onCloseClick: Function = () => {
    router.back()
  }

  onHandleMenuClick: Function = () => {
    router.back()
  }

  // 组件生命周期
  aboutToAppear() {

  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center}) {
          Row() {
            // 返回
            if (this.leftData.canBack) {
              Image(this.titleData.titleStyle == 1 ? $r("app.media.com_icon_backup") : $r("app.media.com_icon_black_backup"))
                .iconStyle()
                .onClick(() => this.onBackClick())
            }

            // 关闭全部
            if (this.leftData.closeAll) {
              Image(this.titleData.titleStyle == 1 ? $r("app.media.com_icon_close") : $r("app.media.com_icon_black_close"))
                .iconStyle()
                .margin({ left: $r('app.float.padding_margin') })
                .onClick(() => this.onCloseClick())
            }
          }
          .width('20%')
          .justifyContent(FlexAlign.Start)

          Column() {
            if (this.titleData.navTitleType == WebNaviViewModel.WebNavigationTitleStyle.Default) {
              Text(this.titleData.title)
                .fontSize($r('app.float.title_text_size'))
                .fontWeight(FontWeight.Medium)
                .textAlign(TextAlign.Center)
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .maxLines(1)
                .fontColor(this.titleData.titleStyle == 1 ? $r('app.color.navigation_title_white'): $r('app.color.navigation_title_black'))
                .width('100%')
            }else{
              Row() {
                Text(this.titleData.tag)
                  .fontSize($r('app.float.title_navi_subtitle_text_size'))
                  .fontWeight(FontWeight.Medium)
                  .textAlign(TextAlign.Center)
                  .textOverflow({overflow: TextOverflow.MARQUEE})
                  .maxLines(1)
                  .fontColor(this.titleData.tagColor)
                  .backgroundColor(this.titleData.tagBgColor)
                  .width('20')
                Text(this.titleData.title)
                  .fontSize($r('app.float.title_navi_title_text_size'))
                  .fontWeight(FontWeight.Medium)
                  .textAlign(TextAlign.Center)
                  .textOverflow({overflow: TextOverflow.MARQUEE})
                  .maxLines(1)
                  .fontColor(this.titleData.titleColor)
              }
              Text(this.titleData.subTitle)
                .fontSize($r('app.float.title_navi_subtitle_text_size'))
                .fontWeight(FontWeight.Regular)
                .textAlign(TextAlign.Center)
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .maxLines(1)
                .fontColor(this.titleData.subTitleColor)
                .width('100%')
            }
          }


          Flex({direction: FlexDirection.Row, justifyContent: FlexAlign.End}) {
            if (this.rightData.showMore) {
              if (this.rightData.listItem.length > 0) {
                Image(this.titleData.titleStyle == 1 ? $r("app.media.com_icon_more") : $r("app.media.com_icon_black_more"))
                  .iconStyle()
                  .margin({ left: $r('app.float.padding_margin') })
                  .onClick(() => this.onHandleMenuClick())
                if (this.rightData.listItem.length > 1) {
                  Image(this.titleData.titleStyle == 1 ? $r("app.media.com_icon_more") : $r("app.media.com_icon_black_more"))
                    .iconStyle()
                    .margin({ left: $r('app.float.padding_margin') })
                    .onClick(() => this.onHandleMenuClick())
                }
              } else {
                Image(this.titleData.titleStyle == 1 ? $r("app.media.com_icon_more") : $r("app.media.com_icon_black_more"))
                  .iconStyle()
                  .margin({ left: $r('app.float.padding_margin') })
                  .onClick(() => this.onHandleMenuClick())
              }
            }
          }
          .width('20%')
        }
        .width(Constants.FULL_PERCENT)
        .height(Constants.DEFAULT_NAVI_HEIGHT)
        .margin({
          top: getStatusBarHeight()
        })
      }.zIndex(ViewZIndex.Z_Top)

      Column() {
        // 背景图
      }
      .zIndex(ViewZIndex.Z_Default)
      .width(Constants.FULL_PERCENT)
      .height(getNaviTotalBarHeight())
      .opacity(this.backgroundData.opacity)
      .linearGradient({colors: [[this.backgroundData.bgColor[0], 0.0],[this.backgroundData.bgColor[1], 1.0]]})
    }
  }
}