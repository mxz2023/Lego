/**
 * @file WebNavigationViewModel.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-19
 * @desc
 */

// system

// module

// view

// model
import { WebNaviBarData, WebNaviTitleData, WebTitleBarItemModel, WebTransparentData, WebTransparentConfig } from '../model/WebNavigationBarModel'

// viewmodel

// tools

// logic



/**
 * 导航样式
 */
export enum WebNavigationStyle {
  While = 1,
  Black = 2
}

/**
 * 导航标题样式
 */
export enum WebNavigationTitleStyle {
  Default = 0,
  SubTitle = 1,  // 带副标题
}

// 标题模型
@Observed
export class WebNaviTitleViewModel {
  showTitle :boolean = true;
  titleStyle :WebNavigationStyle = WebNavigationStyle.Black;
  title :string = "";
  subTitle :string = "";
  titleColor :string = "#000000";
  subTitleColor :string = "#000000";
  tag :string = "";
  tagColor :string = "";
  tagBgColor :string = "";
  navTitleType :WebNavigationTitleStyle = WebNavigationTitleStyle.Default;
}

// 左侧区域
@Observed
export class WebNaviLeftViewModel {
  canBack :boolean = true;
  closeAll :boolean = false;
}

// 右侧单独按钮结构
@Observed
export class WebNaviRightViewItem {
  itemText?:string;   //显示在面板工具栏的按钮文案
  itemIcon?:string;   //显示在面板工具栏的按钮图片
  showItem?:string;   //自定义导航栏右上角按钮内容
  jumpType?:number;   //按钮功能枚举 -(0-无反应 1-跳转页面 2-分享数据 3-说明弹窗 4-调整h5字体大小)
  jumpData?:Map<string, string>;    //跳转体
}

// 右侧区域
@Observed
export class WebNaviRightViewModel {
  showMore: boolean = true;
  listItem: Array<WebNaviRightViewItem> = [];
}

// 透明配置
@Observed
export class WebNaviTransparentConfig {
  naviIcon?:number;   //导航栏icon类型 1白 2黑
  showTitle?:boolean;   //是否展示title
  bgColor?:string;    //背景色
}

// 导航栏背景
@Observed
export class WebNaviBackgroundViewModel {
  titleStyle :WebNavigationStyle = WebNavigationStyle.Black;
  bgColor :Array<ResourceStr> = [$r('app.color.default_background_color')];
  immersionWeb: boolean = false;  // 是否开启沉浸式
  opacity: number = 1;   // 透明度
}

// 导航栏数据结构
@Observed
export class WebNavigationViewModel {

  titleViewModel :WebNaviTitleViewModel;
  leftViewModel :WebNaviLeftViewModel;
  rightViewModel :WebNaviRightViewModel;
  backgroundViewModel :WebNaviBackgroundViewModel;

  normalConfig :WebNaviTransparentConfig;
  scrollConfig :WebNaviTransparentConfig;

  constructor(data?:WebNaviBarData) {

    this.titleViewModel = new WebNaviTitleViewModel();
    this.leftViewModel = new WebNaviLeftViewModel();
    this.rightViewModel = new WebNaviRightViewModel();
    this.backgroundViewModel = new WebNaviBackgroundViewModel();
    this.normalConfig = new WebNaviTransparentConfig();
    this.scrollConfig = new WebNaviTransparentConfig();

    if (data) {
      this.titleViewModel.title = data.title ?? "";

      // 如果有副标题，获取副标题和Tag信息
      if (data.navTitleType == 1 && data.navTitleData) {
        this.titleViewModel.navTitleType = WebNavigationTitleStyle.SubTitle;
        this.titleViewModel.title = data.navTitleData.titleText ?? "";
        this.titleViewModel.titleColor = data.navTitleData.titleTextColor ?? "#000000";

        this.titleViewModel.subTitle = data.navTitleData.subTitleText ?? "";
        this.titleViewModel.subTitleColor = data.navTitleData.subTitleTextColor ?? "#000000";

        this.titleViewModel.tag = data.navTitleData.tagText ?? "";
        this.titleViewModel.tagColor = data.navTitleData.tagTextColor ?? "#000000";
        this.titleViewModel.tagBgColor = data.navTitleData.tagBgColor ?? "#00000000";
      }

      if (data.textColor) {
        // 因为默认背景色是白色，所以如果textColor等于1时，必须设置backColor
        if (data.textColor == WebNavigationStyle.While && data.backColor) {
          this.titleViewModel.titleStyle = data.textColor;
          this.backgroundViewModel.titleStyle = data.textColor;
        } else {
          this.titleViewModel.titleStyle = WebNavigationStyle.Black;
          this.backgroundViewModel.titleStyle = data.textColor;
        }
      }

      if (data.backColor) {
        this.backgroundViewModel.bgColor = data.backColor as Array<string>;
      }

      this.rightViewModel.showMore = data.moreItem ?? true

      if (data.transparentConfig) {
        if (data.transparentConfig.enable) {
          // 开启沉浸式 取沉浸式标题，并且backColor失效
          this.backgroundViewModel.immersionWeb = true
          this.titleViewModel.title = data.transparentConfig.title ?? ''
          this.backgroundViewModel.bgColor = []
          this.backgroundViewModel.opacity = 0
        } else {
          this.backgroundViewModel.immersionWeb = false
          this.backgroundViewModel.opacity = 1
        }

        if (data.transparentConfig.normalConfig) {
          this.normalConfig.naviIcon = data.transparentConfig.normalConfig.naviIcon
          this.normalConfig.showTitle = data.transparentConfig.normalConfig.showTitle
          this.normalConfig.bgColor = data.transparentConfig.normalConfig.bgColor

          this.titleViewModel.titleStyle = this.normalConfig.naviIcon ?? WebNavigationStyle.Black
          this.titleViewModel.showTitle = this.normalConfig.showTitle ?? true
          this.backgroundViewModel.bgColor = this.normalConfig.bgColor ? [this.normalConfig.bgColor] : ['#FFFFFFFF']
        }

        if (data.transparentConfig.scrollConfig) {
          this.scrollConfig = new WebNaviTransparentConfig()
          this.scrollConfig.naviIcon = data.transparentConfig.scrollConfig.naviIcon
          this.scrollConfig.showTitle = data.transparentConfig.scrollConfig.showTitle
          this.scrollConfig.bgColor = data.transparentConfig.scrollConfig.bgColor
        }
      }

      if (data.rightItemList && data.rightItemList.length > 0) {
        for (let index = 0; index < data.rightItemList.length; index++) {
          const element = data.rightItemList[index];
          let item = new WebNaviRightViewItem()
          if (element.itemVersion == 0 && element.showItem) {
            item.showItem = element.showItem
          }
          if (element.itemVersion == 1 && element.itemText && element.itemIcon) {
            item.itemText = element.itemText
            item.itemIcon = element.itemIcon
          }
          item.jumpType = element.jumpType
          item.jumpData = element.jumpData
          this.rightViewModel.listItem.push(item)
        }
      }
    }
  }
}