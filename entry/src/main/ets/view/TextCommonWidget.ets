import CommonConstants from '../common/constants/CommonConstants'

@Component
export default struct TextCommonWidget {
  @Link content: string;
  private textImage?: Resource
  private title?: Resource
  onItemClick?: () => void;

  build() {
    Row() {
      Image(this.textImage !== undefined ? this.textImage : '')
        .width($r('app.float.text_image_size'))
        .height($r('app.float.text_image_size'))
        .margin({ left: $r('app.float.input_left_inside') })
      Text(this.title)
        .fontSize($r('app.float.text_size'))
        .margin({ left: $r('app.float.input_left_inside') })
        .height(CommonConstants.FULL_HEIGHT)
      Text(this.content)
        .fontSize($r('app.float.text_size'))
        .layoutWeight(CommonConstants.WEIGHT_ONE)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .textAlign(TextAlign.End)
        .maxLines(CommonConstants.ONE_LINES)
        .margin({
          left: $r('app.float.content_left_distance'),
          right: $r('app.float.content_right_distance')
        })
      Image($r('app.media.ic_arrow'))
        .width($r('app.float.arrow_image_width'))
        .height($r('app.float.arrow_image_height'))
        .margin({ right: $r('app.float.arrow_right_distance') })
    }
    .height($r('app.float.row_height'))
    .width(CommonConstants.COMMON_DIALOG_WIDTH)
    .backgroundColor(Color.White)
    .margin({ top: $r('app.float.row_top_distance') })
    .borderRadius($r('app.float.dialog_radius'))
    .onClick(this.onItemClick)

  }
}