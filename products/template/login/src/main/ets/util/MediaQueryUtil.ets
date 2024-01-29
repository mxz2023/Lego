import mediaQuery from '@ohos.mediaquery';

/**
 * Media query listener.
 */
class MediaQueryUtil {
  private listener: mediaQuery.MediaQueryListener = mediaQuery.matchMediaSync(`(height <= 360vp)`);

  /**
   * Method for media query to trigger execution.
   *
   * @param mediaQueryResult Media query result.
   */
  private onPortrait = (mediaQueryResult: mediaQuery.MediaQueryResult) => {
    AppStorage.Set<boolean>('isMinHeight', mediaQueryResult.matches);
  }

  /**
   * Register listener.
   */
  public register(): void {
    let portraitFunc = this.onPortrait;
    this.listener.on('change', portraitFunc);
  }

  /**
   * Deregister Listener.
   */
  public unRegister(): void {
    let portraitFunc = this.onPortrait;
    this.listener.off('change', portraitFunc);
  }
}

let mediaQueryUtil = new MediaQueryUtil();

export default mediaQueryUtil as MediaQueryUtil;