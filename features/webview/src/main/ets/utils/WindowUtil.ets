/**
 * @file WindowUtil.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-10
 * @desc
 */

// system
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';


// module
import { Logger } from '@ohos/utils';

// view

// model

// viewmodel

// tools
import { Constants } from '../common/Constants';


// logic



const TAG = '[WindowUtil]';

/**
 * 设置全屏
 * @param windowStage
 * @param context
 */
export function setFullScreen(windowStage: window.WindowStage, context: Context): void {
  windowStage.getMainWindow((err: BusinessError, data: window.Window) => {
    if (err.code) {
      Logger.error(TAG, 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      return;
    }
    let windowClass: window.Window = data;
    Logger.info(TAG, 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));

    // Realize the immersive effect
    let isLayoutFullScreen = true;
    try {
      let type = window.AvoidAreaType.TYPE_SYSTEM;
      // Get status bar height.
      let area: window.AvoidArea = windowClass.getWindowAvoidArea(type);
      getDeviceSize(context, area);
      if (area.topRect.height > 0) {
        let promise: Promise<void> = windowClass.setWindowLayoutFullScreen(isLayoutFullScreen);
        promise.then(() => {
          Logger.info(TAG, 'Succeeded in setting the window layout to full-screen mode.');
        }).catch((err: BusinessError) => {
          Logger.error(TAG, 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        });
      }
    } catch {
      Logger.error(TAG, 'Failed to set the window layout to full-screen mode. ');
    }
  });
}

/**
 * 通过获取Window更新设备大小信息，状态栏、设备宽高
 * @param context
 * @param area
 */
function getDeviceSize(context: Context, area: window.AvoidArea): void {
  // Get device height.
  window.getLastWindow(context).then((data: window.Window) => {
    let properties = data.getWindowProperties();

    AppStorage.setOrCreate<number>('statusBarHeight', px2vp(area.topRect.height));
    AppStorage.setOrCreate<number>('deviceHeight', px2vp(properties.windowRect.height));
    AppStorage.setOrCreate<number>('deviceWidth', px2vp(properties.windowRect.width));
  });
}

export function getStatusBarHeight(): number {
  return AppStorage.get('statusBarHeight') as number || Constants.DEFAULT_STATUS_HEIGHT
}

export function getNaviTotalBarHeight(): number {
  return getStatusBarHeight() + Constants.DEFAULT_NAVI_HEIGHT
}

export function getStatusBarHeightPX(): number {
  return vp2px(getStatusBarHeight())
}

export function getNavBarHeightPX(): number {
  return vp2px(56)
}

