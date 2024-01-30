/**
 * @file WebPageModel.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-15
 * @desc
 */

export class WebPageModel {

  // 页面地址
  url :Resource | string;

  // 标题栏
  title? :string;

  constructor(url:Resource | string, title?:string) {
    this.url = url
    this.title = title ?? ""

  }
}