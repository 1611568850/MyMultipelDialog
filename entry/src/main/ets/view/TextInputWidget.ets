import CommonConstants from '../common/constants/CommonConstants';

@Component
export default struct TextInputWidget {
  private inputImage?: Resource;
  private hitText?: Resource

  build() {
    Row() {
      Image(this.inputImage !== undefined ? this.inputImage : '')
        .width($r('app.float.input_image_size'))
        .height($r('app.float.input_image_size'))
        .margin({ left: $r('app.float.input_image_left') })
      TextInput({ placeholder: this.hitText })
        .layoutWeight(CommonConstants.WEIGHT_ONE)
        .height($r('app.float.input_row_height'))
        .padding({ left: $r('app.float.input_left_inside') })
        .margin({ right: $r('app.float.input_right_inside') })
        .placeholderColor($r('app.color.place_color'))
        .fontWeight(FontWeight.Normal)
        .fontStyle(FontStyle.Normal)
        .fontSize($r('app.float.input_text_size'))
        .fontColor(Color.Black)
        .backgroundColor(Color.White)

    }
    .width(CommonConstants.COMMON_DIALOG_WIDTH)
    .height($r('app.float.input_row_height'))
    .borderRadius($r('app.float.row_radius'))
    .backgroundColor(Color.White)
    .margin({ top: $r('app.float.input_row_top') })
  }
}