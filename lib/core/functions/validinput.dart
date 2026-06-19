import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? validInput(
  String val,
  int min,
  int max,
  String type,
) {
  val = val.trim();

  // Empty check
  if (val.isEmpty) {
    return "This field can't be empty";
  }

  // Length validation
  if (val.length < min) {
    return "Can't be less than $min characters";
  }

  if (val.length > max) {
    return "Can't be more than $max characters";
  }

  // Type validation
  switch (type) {
    case "username":
      if (!GetUtils.isUsername(val)) {
        return "Please enter a valid username";
      }
      break;

    case "email":
      if (!GetUtils.isEmail(val)) {
        return "Please enter a valid email";
      }
      break;

    case "phone":
      if (!RegExp(
        r'^09\d{8}$',
      ).hasMatch(val)) {
        return "Phone must start with 09 and contain 10 digits";
      }
      break;

    case "password":
      if (val.length < 8) {
        return "Password must be at least 8 characters";
      }
      break;
  }

  return null;
}
