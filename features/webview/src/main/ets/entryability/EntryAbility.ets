/**
 * @file EntryAbility.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-10
 * @desc
 */

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

import { Logger } from '@ohos/utils'

import { Constants } from '../common/Constants'
import { setFullScreen } from '../utils/WindowUtil'


const TAG = '[EntryAbility]';


export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info(TAG, 'Ability onCreate');
  }

  onDestroy(): void {
    Logger.info(TAG, 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.info(TAG, 'Ability onWindowStageCreate');

    // 设置沉浸式
    setFullScreen(windowStage, this.context);

    windowStage.loadContent(Constants.PAGE_MAIN);
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.info(TAG, 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    Logger.info(TAG, 'Ability onBackground');
  }
}
