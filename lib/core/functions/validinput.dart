import 'package:get/get_utils/get_utils.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "username not valid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "email not valid";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "phone not valid";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
