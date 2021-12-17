import 'package:flutter_svg/flutter_svg.dart';

abstract class AppSvg {
  static late final arrowLeft = SvgPicture.asset("assets/svg/arrow_left.svg");
  static late final bookSaved = SvgPicture.asset("assets/svg/book_saved.svg");
  static late final bookSavedDisabled = SvgPicture.asset("assets/svg/book_saved_disabled.svg");
  static late final profile = SvgPicture.asset("assets/svg/profile.svg");
  static late final profileDisabled = SvgPicture.asset("assets/svg/profile_disabled.svg");
  static late final reserve = SvgPicture.asset("assets/svg/reserve.svg");
  static late final reserveDisabled = SvgPicture.asset("assets/svg/reserve_disabled.svg");
}
