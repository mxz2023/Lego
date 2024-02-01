/**
 * Copyright (c) 2023-2024 Mxz Co., Ltd.
 *
 * @file Entryability.ets
 * @project Lego
 * @author gemini
 * @crateTime 2024-01-30
 * @desc
 */

import { getNavi } from '../component/navi'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      getNavi()
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}