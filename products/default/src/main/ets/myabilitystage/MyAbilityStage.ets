/**
 * Copyright (c) 2023-2024 Mxz Co., Ltd.
 *
 * @file MyAbilityStage.ets
 * @project Lego
 * @author gemini
 * @crateTime 2024-02-01
 * @desc
 */

// system
import AbilityStage from '@ohos.app.ability.AbilityStage';
import type Want from '@ohos.app.ability.Want';


export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    // 应用的HAP在首次加载的时，为该Module初始化操作
  }
  onAcceptWant(want: Want): string {
    // 仅specified模式下触发
    return 'MyAbilityStage';
  }
}
