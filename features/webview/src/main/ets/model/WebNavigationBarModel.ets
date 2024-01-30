/**
 * @file WebNavigationBarModel.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-19
 * @desc
 */

export class WebNaviTitleData {
  tagText?:string    //标签文案
  tagBgColor?:string   //标签背景颜色
  tagTextColor?:string   //标签文案颜色
  titleText?:string    //标题文案
  titleTextColor?:string   //标题文案颜色
  subTitleText?:string   //副标题文案
  subTitleTextColor?:string    //副标题文案颜色
}

export class WebTransparentConfig {
  naviIcon?:number   //导航栏icon类型 1白 2黑
  showTitle?:boolean   //是否展示title
  bgColor?:string    //背景色
}

export class WebTransparentData {
  enable?:boolean    //是否设置沉浸式导航栏
  isHidden?:boolean    //是否设置沉浸式导航栏隐藏返回按钮以及更多按钮控件 6.3.10支持
  title?:string    //导航标题
  normalConfig?:WebTransparentConfig   //初始化配置
  scrollConfig?:WebTransparentConfig   //滚动配置
}

export class WebTitleBarItemModel {
  itemVersion?:number    //按钮类型 当itemVersion为0时showItem字段生效 当itemVersion为1时itemText和itemIcon字段生效
  itemText?:string   //显示在面板工具栏的按钮文案 当itemVersion为1时itemText字段生效
  itemIcon?:string   //显示在面板工具栏的按钮图片 当itemVersion为1时itemIcon字段生效
  showItem?:string   //自定义导航栏右上角按钮内容 当itemVersion为0时showItem字段生效 若是文案则直接显示文案 若是图片则显示图片  图片尺寸88x88！！！
  jumpType?:number   //按钮功能枚举 -(0-无反应 1-跳转页面 2-分享数据 3-说明弹窗 4-调整h5字体大小)
  jumpData?:Map<string, string>    //跳转体

}

export class WebNaviBarData {
  version:number = 100    //协议版本号 固定值100 必传
  title:string = ""    //导航标题
  moreItem:boolean = true    //默认YES  是否显示菜单按钮(三个小点)
  backColor?:Array<string>   //导航栏背景色 list类型 色值为标准十六进制颜色字符串，如果是渐变色就放两个元素 为渐变色的起始色值和终止色值，若纯色放一个元素。
  textColor:number = 2   //默认黑色 设置返回、关闭、更多按钮以及文案颜色样式 【1-白；2-黑】仅支持1和2
  rightItemList?:Array<WebTitleBarItemModel>

  hideTools?:boolean   //是否隐藏 分享相关控件
  showAdjustFont?:boolean    //是否隐藏 设置字号工具
  usedTitle?:boolean   //title 是否有用， no:title 无效用默认的  yes:title为nil是隐藏，否则显示

  transparentConfig?:WebTransparentData    //沉浸式导航栏模型

  navTitleType:number = 0   //导航栏标题类型 0 ：默认样式   1：带副标题带标签的样式
  navTitleData?:WebNaviTitleData   //新样式数据模型
}