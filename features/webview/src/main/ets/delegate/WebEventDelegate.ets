/**
 * @file WebEventDelegate.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-23
 * @desc
 */
import { Callback } from '@ohos.base';

import { WebScrollEventModel } from '../model/WebEventModel'


export class WebEventDelegate {
  handleWebScrollEvent: Callback<WebScrollEventModel>

  constructor(
    scrollHandle: Callback<WebScrollEventModel>) {

    this.handleWebScrollEvent = scrollHandle;
  }
}
