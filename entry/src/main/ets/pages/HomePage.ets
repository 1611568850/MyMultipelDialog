import CommonConstants from '../common/constants/CommonConstants'
import TextCommonWidget from '../view/TextCommonWidget'
import TextInputWidget from '../view/TextInputWidget'
import CommonUtils from '../common/utils/CommonUtils'

@Entry
@Component
struct Index {
  @State birthdate: string = ''
  @State sex: string = ''
  @State hobby: string = ''
  private sexArray: Resource = $r('app.strarray.sex_array');

  build() {
    Row() {
      Column() {
        Image($r('app.media.ic_back'))
          .width($r('app.float.image_back_size'))
          .height($r('app.float.image_back_size'))
          .alignSelf(ItemAlign.Start)
          .margin({ left: CommonConstants.BACK_MARGIN_LEFT, top: CommonConstants.BACK_MARGIN_TOP })
        Image($r('app.media.ic_avatar'))
          .width($r('app.float.avatar_size'))
          .height($r('app.float.avatar_size'))
          .alignSelf(ItemAlign.Center)
          .margin({ top: CommonConstants.AVATAR_MARGIN_TOP })
        Text($r('app.string.text_personal_title'))
          .fontColor(Color.Black)
          .fontSize($r('app.float.text_size'))
          .margin({ top: CommonConstants.PERSONAL_MARGIN_TOP })
          .alignSelf(ItemAlign.Center)
        TextInputWidget({
          inputImage: $r('app.media.ic_nickname'),
          hitText: $r('app.string.text_input_hint')
        })
        TextCommonWidget({
          textImage: $r('app.media.ic_birthdate'),
          title: $r('app.string.title_birthdate'),
          content: $birthdate,
          onItemClick: () => {
            CommonUtils.datePickerDialog((birtValue) => {
              this.birthdate = birtValue
            })
          }
        })
        TextCommonWidget({
          textImage: $r('app.media.ic_sex'),
          title: $r('app.string.title_sex'),
          content: $sex,
          onItemClick: () => {
            CommonUtils.textPickerDialog(this.sexArray, (sexValue) => {
              this.sex = sexValue
            })
          }
        })
        TextInputWidget({
          inputImage: $r('app.media.ic_signature'),
          hitText: $r('app.string.text_input_signature')
        })
        TextCommonWidget({
          textImage: $r('app.media.ic_hobbies'),
          title: $r('app.string.title_hobbies'),
          content: $hobby
        })

      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.FULL_HEIGHT)
      .backgroundColor($r('app.color.column_background_color'))
    }
    .height('100%')
  }
}