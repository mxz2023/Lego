/**
 * @file WebProxy.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-12
 * @desc
 */

// system
import router from '@ohos.router';

// module
import { Logger } from '@ohos/utils';

// model
import { WebResponseParam } from '../model/WebResponseParam';
import { WebNaviBarData } from '../model/WebNavigationBarModel'
import { WebPageModel } from '../model/WebPageModel'

// viewmodel
import * as WebNaviViewModel from '../viewmodel/WebNavigationViewModel'
import { WebCloseViewModel } from '../viewmodel/WebCloseViewModel'


// tools
import { getStatusBarHeightPX, getNavBarHeightPX } from '../utils/WindowUtil'
import { Constants } from '../common/Constants'

// logic
import { WebProxyDelegate } from '../delegate/WebProxyDelegate'
import { WebBridge } from './WebBridge'



const TAG = '[WebProxy]';

export class WebProxy {

  delegate: WebProxyDelegate

  // 不允许外部构建
  constructor(delegate:WebProxyDelegate) {
    this.delegate = delegate
  }

  getMethodList() {
    return [
      'closeWebView',
      'closeWebViewExtend',
      'goToComment',
      'sendWeiXinCot',
      'sendRecord',
      'getResponse',
      'JDPaySDK',
      'WebViewNaviBar',
      'JDJRWebStat',
      'closeWebViewScheme',
      'showSecurityKeyboard'
    ]
  }

  closeWebView(data:string) {
    Logger.debug(TAG, 'closeWebView')
    let webCloseViewModel = new WebCloseViewModel()
    this.delegate.closeWeb(webCloseViewModel)
  }

  closeWebViewExtend(data:string) {
    Logger.debug(TAG, 'closeWebViewExtend')
    let webCloseViewModel = new WebCloseViewModel()
    this.delegate.closeWeb(webCloseViewModel)
  }

  goToComment(data:string) {
    Logger.error(TAG, 'goToComment not implement')
  }

  sendWeiXinCot(data:string) {
    Logger.error(TAG, 'sendWeiXinCot not implement')
  }

  sendRecord(data:string) {
    Logger.error(TAG, 'sendRecord not implement')
  }

  getResponse(data:string) {
    Logger.info(TAG, 'getResponse')

    let item:WebResponseParam = JSON.parse(data) as WebResponseParam;
    switch (item.type) {
      case "2": {
        // 设置Web导航栏标题
        let titleViewModel = new WebNaviViewModel.WebNaviTitleViewModel()
        titleViewModel.title = item.data as string

        this.delegate.updateTitle(titleViewModel)
        break
      }
      case "3": {
        // 设置导航栏背景色
        if (item.colorArr && item.colorArr.length > 0) {
          let backgroundViewModel = new WebNaviViewModel.WebNaviBackgroundViewModel()
          if(item.colorArr.length == 1) {
            backgroundViewModel.bgColor[0] = item.colorArr[0]
            backgroundViewModel.bgColor[1] = item.colorArr[0]
          } else {
            backgroundViewModel.bgColor = item.colorArr
          }

          this.delegate.updateBackgroundView(backgroundViewModel)
        }
        break
      }
      case "7":{
        // 白条添加银行卡成功后刷新界面
        break;
      }
      case "9": {
        // 获取客户端位置以及设置信息
        break;
      }
      case "14": {
        // 设置隐藏返回按键和关闭按键
        let leftViewModel = new WebNaviViewModel.WebNaviLeftViewModel()
        leftViewModel.canBack = item.hidden == 1 ? false : true
        leftViewModel.closeAll = item.hidden == 1 ? false : true

        this.delegate.updateLeftView(leftViewModel)
        break
      }
      case "42": {
        // 获取生物探针
        break
      }
      case "74": {
        // 获取导航栏高度
        let statusBarHeight = getStatusBarHeightPX()
        let navBarHeight = getNavBarHeightPX()
        let navBarTotalHeight = statusBarHeight + navBarHeight

        // 1vp=3px, 白条提现页面使用dp，按px使用，所以需要在原值上除以3
        let result :Record<string, string> = {
          "callbackid": item.callbackid as string,
          "statusBarHeight": statusBarHeight+"",
          "navBarHeight": navBarHeight+"",
          "navBarTotalHeight": navBarTotalHeight+"",
          "statusBarHeightDp": statusBarHeight/3+"",
          "navBarHeightDp": navBarHeight/3+"",
          "navBarTotalHeightDp": navBarTotalHeight/3+"",
          "statusBarHeightPx": statusBarHeight/3+"",
          "navBarHeightPx": navBarHeight/3+"",
          "navBarTotalHeightPx": navBarTotalHeight/3+""
        }
        this.delegate.callJsBridge(result)
        break
      }
      case "75": {
        // 获取个性化推荐的开关状态
        break
      }
      default :{
        break
      }
    }
  }

  JDPaySDK(data:string) {
    Logger.error(TAG, 'JDPaySDK not implement')
  }

  WebViewNaviBar(data:string) {
    Logger.debug(TAG, 'WebViewNaviBar')
    let item:WebNaviBarData = JSON.parse(data) as WebNaviBarData;

    if (this.delegate && item) {
      let navViewModel = new WebNaviViewModel.WebNavigationViewModel(item)
      this.delegate.updateNaviBar(navViewModel)
    }
  }

  JDJRWebStat(data:string) {
    Logger.info(TAG, 'JDJRWebStat not implement')
  }

  closeWebViewScheme(data:string) {
    Logger.debug(TAG, 'closeWebViewScheme')
    try {
      let item: Object = JSON.parse(data);
      if ( item ) {
        console.log("1");
      } else {
        console.log("0");
      }
    } catch (e) {
      // 无法解析，说明可能是字符串
      if (typeof (data) == 'string') {
        let params: WebPageModel = new WebPageModel(data, '');

        router.pushUrl({
          url: Constants.PAGE_WEB,
          params: params
        })
      } else {
        Logger.error(TAG, "closeWebViewScheme unknown data type")
      }
    }
  }

  showSecurityKeyboard(data:string) {
    Logger.error(TAG, 'showSecurityKeyboard not implement')
  }
}