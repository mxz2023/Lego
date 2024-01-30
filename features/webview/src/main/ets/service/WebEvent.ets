/**
 * @file WebEvent.ets
 * @project JDJR_BMC_WebView
 * @author zhongyafeng
 * @crateTime 2024-01-14
 * @desc
 */

// system


// module
import { Logger } from '@ohos/utils';

// tools


// model
import { WebScrollEventModel } from '../model/WebEventModel'


// logic
import { WebEventDelegate } from '../delegate/WebEventDelegate'



const TAG = '[WebEventHandler]';

export class WebEvent {

  delegate: WebEventDelegate

  constructor(delegate: WebEventDelegate) {
    this.delegate = delegate;
  }

  handlePageBegin( url: string ) {
    Logger.debug(TAG, 'start loading');
  }

  handlePageEnd( url: string ) {
    Logger.debug(TAG, 'end loading');
  }

  handleErrorReceive(request: WebResourceRequest, error: WebResourceError) {
    Logger.debug(TAG, 'receive error');
  }

  handleScroll(xOffset:number, yOffset:number) {
    Logger.debug(TAG, 'receive error');
    let event = new WebScrollEventModel();
    event.xOffset = xOffset;
    event.yOffset = yOffset;
    this.delegate.handleWebScrollEvent(event);
  }
}