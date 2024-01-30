/**
 * @file WebProxyDelegate.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-22
 * @desc
 */
import { Callback } from '@ohos.base';

import * as WebNaviViewModel from '../viewmodel/WebNavigationViewModel';
import { WebCloseViewModel } from '../viewmodel/WebCloseViewModel'

export class WebProxyDelegate {

  callJsBridge: Callback<Record<string, string>>
  closeWeb: Callback<WebCloseViewModel>
  updateNaviBar: Callback<WebNaviViewModel.WebNavigationViewModel>
  updateTitle: Callback<WebNaviViewModel.WebNaviTitleViewModel>
  updateLeftView: Callback<WebNaviViewModel.WebNaviLeftViewModel>
  updateRightView: Callback<WebNaviViewModel.WebNaviRightViewModel>
  updateBackgroundView: Callback<WebNaviViewModel.WebNaviBackgroundViewModel>

  constructor(
    callJsBridge:Callback<Record<string, string>>,
    closeWeb: Callback<WebCloseViewModel>,
    updateNaviBar:Callback<WebNaviViewModel.WebNavigationViewModel>,
    updateTitle: Callback<WebNaviViewModel.WebNaviTitleViewModel>,
    updateLeftView: Callback<WebNaviViewModel.WebNaviLeftViewModel>,
    updateRightView: Callback<WebNaviViewModel.WebNaviRightViewModel>,
    updateBackgroundView: Callback<WebNaviViewModel.WebNaviBackgroundViewModel>
  ) {
    this.callJsBridge = callJsBridge;
    this.closeWeb = closeWeb;
    this.updateNaviBar = updateNaviBar;
    this.updateTitle = updateTitle;
    this.updateLeftView = updateLeftView;
    this.updateRightView = updateRightView;
    this.updateBackgroundView = updateBackgroundView;
  }
}