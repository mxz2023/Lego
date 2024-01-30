/**
 * @file WebLoading.ets
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


export enum LoadingStyle {
  Default = 1,
  Percent = 2
}


@Component
export struct WebLoading {

  @State style: LoadingStyle = LoadingStyle.Default

  // 进度条
  @Link percent:number;

  build() {
    Column() {
      if (this.style == LoadingStyle.Default) {
        Column() {
          LoadingProgress()
        }
        .margin({top: $r('app.float.loading_img_margin')})
        .width($r('app.float.loading_img_size'))
        .height($r('app.float.loading_img_size'))
      } else if (this.style == LoadingStyle.Percent) {
        Column() {
          Progress({value:this.percent})
            .width(Constants.FULL_PERCENT)
        }
        .margin({top:'0vp',left:'0vp'})
        .width(Constants.FULL_PERCENT)
        .height('2vp')
      }
    }
    .height(Constants.FULL_PERCENT)
    .width(Constants.FULL_PERCENT)
    .alignItems( this.style == LoadingStyle.Percent ? HorizontalAlign.Start: HorizontalAlign.Center)
  }
}