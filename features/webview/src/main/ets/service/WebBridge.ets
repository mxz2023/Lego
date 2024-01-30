/**
 * @file WebProxy.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-16
 * @desc
 */

// system
import webview from '@ohos.web.webview';

// module

// tools

// logic
import { WebBridgeDelegate } from '../delegate/WebBridgeDelegate';


export class WebBridge {

  delegate: WebBridgeDelegate
  controller: webview.WebviewController;

  constructor(delegate: WebBridgeDelegate, controller: webview.WebviewController) {
    this.delegate = delegate;
    this.controller = controller;
  }

  callToWeb(data:Record<string, string>) {
    let result:string = JSON.stringify(data)
    let js:string = "goToGetres(" + JSON.stringify(result) + ")"
    this.controller.runJavaScript(js);
  }
}