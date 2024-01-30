/**
 * @file WebView.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-11
 * @desc
 */

// system
import webview from '@ohos.web.webview';


// module
import { Logger } from '@ohos/utils';


// view
import { LoadingStyle, WebLoading } from './WebLoading';
import { WebError } from './WebError';

// model


// viewmodel


// tools
import { Constants, WebpageStatus } from '../common/Constants'


// logic
import { WebProxy } from '../service/WebProxy'
import { WebEvent } from '../service/WebEvent'


const TAG = '[WebView]';


@Component
export struct WebView {

  url: ResourceStr = "";
  userAgent :string = "";

  @Link webViewController: webview.WebviewController;
  @Link eventHandler :WebEvent;
  @Link proxyHandler :WebProxy;

  @State webStatus: WebpageStatus = WebpageStatus.INIT;
  @State percent: number = 10

  build() {
    Stack() {
      Web({ controller: this.webViewController, src: this.url })
        .darkMode(WebDarkMode.Auto)
        .domStorageAccess(true)
        .zoomAccess(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All)
        .cacheMode(CacheMode.None)
        .javaScriptAccess(true)
        .width(Constants.FULL_PERCENT)
        .onScroll((event) => {
          event && this.eventHandler && this.eventHandler.handleScroll(event.xOffset, event.yOffset)
        })
        .onControllerAttached(()=> {
          // 注册JS对象
          this.webViewController.registerJavaScriptProxy(this.proxyHandler, 'jd', this.proxyHandler.getMethodList())
          this.webViewController.refresh();
        })
        .onPageBegin((event) => {
          event && this.eventHandler && this.eventHandler.handlePageBegin(event.url)

          // 应用侧用法示例，定制UserAgent。
          const userAgent = this.webViewController.getUserAgent() + this.userAgent
          this.webViewController.setCustomUserAgent(userAgent)
        })
        .onPageEnd((event) => {
          event && this.eventHandler.handlePageEnd(event.url)

          if (this.webStatus != WebpageStatus.ERROR) {
            this.webStatus = WebpageStatus.FINISHED;
          }
        })
        .onProgressChange((event) => {
          Logger.info(TAG, 'newProgress:' + event?.newProgress);

          event && (this.percent = event.newProgress);
        })
        .onErrorReceive((event) => {
          event && this.eventHandler && this.eventHandler.handleErrorReceive(event.request, event.error)

          this.webStatus = WebpageStatus.FINISHED
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            Logger.error(TAG, 'url:' + event.request.getRequestUrl())
            Logger.error(TAG, 'isMainFrame:' + event.request.isMainFrame())
            Logger.error(TAG, 'isRedirect:' + event.request.isRedirect())
            Logger.error(TAG, 'isRequestGesture:' + event.request.isRequestGesture())
            Logger.error(TAG, 'getResponseData:' + event.response.getResponseData())
            Logger.error(TAG, 'getResponseEncoding:' + event.response.getResponseEncoding())
            Logger.error(TAG, 'getResponseMimeType:' + event.response.getResponseMimeType())
            Logger.error(TAG, 'getResponseCode:' + event.response.getResponseCode())
            Logger.error(TAG, 'getReasonMessage:' + event.response.getReasonMessage())
            let result = event.request.getRequestHeader()
            Logger.error(TAG, 'The request header result size is ' + result.length)
            for (let i of result) {
              Logger.error(TAG, 'The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue)
            }
            let resph = event.response.getResponseHeader()
            Logger.error(TAG, 'The response header result size is ' + resph.length)
            for (let i of resph) {
              Logger.error(TAG, 'The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue)
            }
          }
        })
        .onRenderExited((event) => {
          if (event) {
            Logger.error(TAG, 'reason:' + event.renderExitReason)
          }
        })
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowNew((event) => {
          Logger.debug(TAG, 'onWindowNew:' + event)
        })
        .onLoadIntercept((event) => {
          Logger.debug(TAG, 'onLoadIntercept url:' + event.data.getRequestUrl())
          Logger.debug(TAG, 'onLoadIntercept isMainFrame:' + event.data.isMainFrame())
          Logger.debug(TAG, 'onLoadIntercept isRedirect:' + event.data.isRedirect())
          Logger.debug(TAG, 'onLoadIntercept isRequestGesture:' + event.data.isRequestGesture())
          return false
        })
        .onAlert((event) => {
          if (event) {
            AlertDialog.show({
              title: 'onAlert',
              message: event.message,
              primaryButton: {
                value: '取消',
                action: () => {
                  event.result.handleCancel()
                }
              },
              secondaryButton: {
                value: '确定',
                action: () => {
                  event.result.handleConfirm()
                }
              },
              cancel: () => {
                event.result.handleCancel()
              }
            })
          }
          return true
        })

      // 页面加载中
      if (this.webStatus === WebpageStatus.INIT) {
        Column() {
          WebLoading({style:LoadingStyle.Percent, percent:this.percent})
        }
        .backgroundColor(Color.White)
      }

      // 页面报错
      if (this.webStatus === WebpageStatus.ERROR) {
        Column() {
          WebError({ handleReload: () => {
            this.webViewController.refresh();
            this.webStatus = WebpageStatus.INIT;
          } })
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .width(Constants.FULL_PERCENT)
        .height(Constants.FULL_PERCENT)
      }
    }
  }
}