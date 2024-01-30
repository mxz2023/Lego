/**
 * @file WebBridgeDelegate.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-22
 * @desc
 */
import { Callback } from '@ohos.base'


export class WebBridgeDelegate {

  handleJsBridgeEvent: Callback<object>

  constructor(handleJsBridgeEvent: Callback<object>) {
    this.handleJsBridgeEvent = handleJsBridgeEvent
  }
}