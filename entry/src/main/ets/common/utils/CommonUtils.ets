import CommonConstants from '../constants/CommonConstants'
import Logger from '../utils/Logger'

export class CommonUtils {
  datePickerDialog(dateCb: Function) {
    DatePickerDialog.show({
      start: new Date(CommonConstants.START_TIME),
      end: new Date(),
      selected: new Date(CommonConstants.SELECT_TIME),
      onAccept: (value: DatePickerResult) => {
        let year: number = Number(value.year);
        let month: number = Number(value.month) + CommonConstants.PLUS_ONE
        let day: number = Number(value.day)
        let birthdate: string = this.getBirthDateValue(year, month, day)
        dateCb(birthdate)
      }
    })
  }

  getBirthDateValue(year: number, month: number, day: number): string {
    let birthdate: string = `${year}${CommonConstants.DATE_YEAR}${month}` +
    `${CommonConstants.DATE_MONTH}${day}${CommonConstants.DATE_DAY}`;
    return birthdate;
  }
  // 选项弹窗
  textPickerDialog(sexArr: Resource, sexCb: Function) {
    if (this.isEmpty(sexArr)) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'sex is null')
      return
    }
    TextPickerDialog.show({
      range: sexArr,
      selected: 0,
      onAccept: (result: TextPickerResult) => {
        sexCb(result.value)
      },
      onCancel: () => {
        Logger.info(CommonConstants.TAG_COMMON_UTILS, 'TextPickerDialog onCancel');
      }
    })
  }
  //  判断数组是否为空
  isEmpty(obj: object | string): boolean {

    return false
  }
}


export default new CommonUtils();
