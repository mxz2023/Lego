/**
 * @file Constants.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-10
 * @desc
 */

export class Constants {
  /**
   * 主UI路由
   */
  static readonly PAGE_MAIN: string = 'pages/Main';

  /**
   * 主UI路由
   */
  static readonly PAGE_WEB: string = 'pages/WebViewPage';

  /**
   * 100 percent
   */
  static readonly FULL_PERCENT: string = '100%';

  /**
   * Default status height
   */
  static readonly DEFAULT_STATUS_HEIGHT: number = 32;

  /**
   * Default navigation height
   */
  static readonly DEFAULT_NAVI_HEIGHT: number = 56;
}

// view层级的z防线索引，越大越在上面
export enum ViewZIndex {
  Z_Default = 0,
  Z_Top = 1
}

export enum WebpageStatus {
  INIT = 'init',
  ERROR = 'error',
  FINISHED = 'finished'
}

