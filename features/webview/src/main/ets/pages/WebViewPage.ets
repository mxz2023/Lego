/**
 * @file WebViewPage.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-11
 * @desc
 */

// system
import webview from '@ohos.web.webview';
import router from '@ohos.router';
import { Callback } from '@ohos.base';


// module
import { Logger } from '@ohos/utils';


// view
import { WebNavigationBar } from '../view/WebNavigationBar'
import { WebView } from '../view/WebView'


// model
import { WebPageModel } from '../model/WebPageModel'


// viewmodel
import { WebCloseViewModel } from '../viewmodel/WebCloseViewModel'
import * as WebNaviViewModel from '../viewmodel/WebNavigationViewModel';


// service
import { WebProxy } from '../service/WebProxy'
import { WebProxyDelegate } from '../delegate/WebProxyDelegate';

import { WebBridge } from '../service/WebBridge';
import { WebBridgeDelegate } from '../delegate/WebBridgeDelegate'

import { WebEvent } from '../service/WebEvent'
import { WebEventDelegate } from '../delegate/WebEventDelegate'


// tools
import { Constants, ViewZIndex } from '../common/Constants'
import { getStatusBarHeight } from  '../utils/WindowUtil'
import { WebScrollEventModel } from '../model/WebEventModel';


const TAG = '[WebViewPage]';


@Entry
@Component
struct WebViewPage {

  // 地址
  @State url :string | Resource = (router.getParams() as WebPageModel).url ?? "";

  // UA
  @State userAgent :string = "&application=JDJR-App&clientType=Android&src=JDJR&version=6.8.10&clientVersion=6.8.10&osVersion=13";

  @State titleData :WebNaviViewModel.WebNaviTitleViewModel = new WebNaviViewModel.WebNaviTitleViewModel()
  @State leftData :WebNaviViewModel.WebNaviLeftViewModel = new WebNaviViewModel.WebNaviLeftViewModel()
  @State rightData :WebNaviViewModel.WebNaviRightViewModel = new WebNaviViewModel.WebNaviRightViewModel()
  @State backgroundData :WebNaviViewModel.WebNaviBackgroundViewModel = new WebNaviViewModel.WebNaviBackgroundViewModel()
  @State naviData :WebNaviViewModel.WebNavigationViewModel = new WebNaviViewModel.WebNavigationViewModel()

  // 代理事件回调
  // 调用jsBridge
  callJsBridge: Callback<Record<string, string>> = (data: Record<string, string>) => {
    this.jsBridge.callToWeb(data)
  }

  // 关闭Web浏览器
  closeWeb: Callback<WebCloseViewModel> = (data :WebCloseViewModel) => {
    router.back()
  }

  // 更新导航栏
  updateNaviBar: Callback<WebNaviViewModel.WebNavigationViewModel> = (data :WebNaviViewModel.WebNavigationViewModel) => {
    this.naviData = data
    this.titleData = data.titleViewModel
    this.leftData = data.leftViewModel
    this.rightData = data.rightViewModel
    this.backgroundData = data.backgroundViewModel
  }

  // 更新标题内容
  updateTitle: Callback<WebNaviViewModel.WebNaviTitleViewModel> = (data :WebNaviViewModel.WebNaviTitleViewModel) => {
    this.titleData = data
  }

  // 更新导航栏返回按钮和关闭全部按钮状态
  updateLeftView: Callback<WebNaviViewModel.WebNaviLeftViewModel> = (data :WebNaviViewModel.WebNaviLeftViewModel) => {
    this.leftData = data
  }

  // 更新导航栏扩展面板信息
  updateRightView: Callback<WebNaviViewModel.WebNaviRightViewModel> = (data :WebNaviViewModel.WebNaviRightViewModel) => {
    this.rightData = data
  }

  // 更导航栏背景
  updateBackgroundView: Callback<WebNaviViewModel.WebNaviBackgroundViewModel> = (data :WebNaviViewModel.WebNaviBackgroundViewModel) => {
    this.backgroundData = data
  }

  // js桥事件回调
  handleJsBridgeEvent: Callback<object> = (data: object) => {

  }

  // WebView事件回调
  handleWebScrollEvent: Callback<WebScrollEventModel> = (data: WebScrollEventModel) => {

    let navBarTotalHeight = 56 + getStatusBarHeight() // 单位vp

    if (data.yOffset > navBarTotalHeight) {
      this.backgroundData.opacity = 1
      this.titleData.titleStyle = this.naviData.scrollConfig.naviIcon ?? WebNaviViewModel.WebNavigationStyle.Black
      this.titleData.showTitle = this.naviData.scrollConfig.showTitle ?? true
      this.backgroundData.bgColor = this.naviData.scrollConfig.bgColor ? [this.naviData.scrollConfig.bgColor] : [$r('module.color.default_background_color')]
    } else {
      this.backgroundData.opacity = data.yOffset / navBarTotalHeight
      this.titleData.titleStyle = this.naviData.normalConfig.naviIcon ?? WebNaviViewModel.WebNavigationStyle.Black
      this.titleData.showTitle = this.naviData.normalConfig.showTitle ?? true
      this.backgroundData.bgColor = this.naviData.normalConfig.bgColor ? [this.naviData.normalConfig.bgColor] : [$r('app.color.default_background_color')]
    }
  }


  // 设置代理
  proxyDelegate = new WebProxyDelegate(
    this.callJsBridge,
    this.closeWeb,
    this.updateNaviBar,
    this.updateTitle,
    this.updateLeftView,
    this.updateRightView,
    this.updateBackgroundView
  )

  // 设置桥代理
  bridgeDelegate = new WebBridgeDelegate(
    this.handleJsBridgeEvent
  )

  // 设置Web事件代理
  eventDelegate = new WebEventDelegate(
    this.handleWebScrollEvent,
  )

  @State webViewController: webview.WebviewController = new webview.WebviewController();
  @State jsBridge :WebBridge = new WebBridge(this.bridgeDelegate, this.webViewController);
  @State proxy :WebProxy = new WebProxy(this.proxyDelegate)
  @State event :WebEvent = new WebEvent(this.eventDelegate);


  aboutToAppear() {
    Logger.info(TAG, "aboutToAppear");
    this.titleData.title = (router.getParams() as WebPageModel).title ?? "";

    webview.WebviewController.initializeWebEngine();
    webview.WebviewController.setWebDebuggingAccess(true);
  }

  onPageShow() {
    Logger.info(TAG, "onPageShow");
  }

  onPageEnd() {
    Logger.info(TAG, "onPageEnd");
  }

  onBackPress() {
    Logger.info(TAG, "onBackPress");
  }

  onPageHide() {
    Logger.info(TAG, "onPageHide");
  }

  aboutToDisappear() {
    Logger.info(TAG, "aboutToDisappear");
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      WebNavigationBar({
        titleData: this.titleData,
        leftData: this.leftData,
        rightData: this.rightData,
        backgroundData: this.backgroundData,
        webViewController: this.webViewController
      }).zIndex(ViewZIndex.Z_Top)

      WebView({
        url: this.url,
        userAgent: this.userAgent,
        webViewController: this.webViewController,
        proxyHandler: this.proxy,
        eventHandler: this.event
      }).zIndex(ViewZIndex.Z_Default)
        .padding({top: this.backgroundData.immersionWeb ? 0: Constants.DEFAULT_NAVI_HEIGHT})
        .margin({top: this.backgroundData.immersionWeb ? 0: getStatusBarHeight()})
    }
  }
}