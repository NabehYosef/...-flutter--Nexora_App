import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? validInput(
  String val,
  int min,
  int max,
  String type,
) {
  val = val.trim();

  // ① Empty check
  if (val.isEmpty) {
    switch (type) {
      case "username":
        return "44".tr;
      case "email":
        return "45".tr;
      case "phone":
        return "46".tr;
      case "password":
        return "47".tr;
      case "birthDate":
        return "48".tr;
      default:
        return "49".tr;
    }
  }

  switch (type) {
    case "username":
      if (val.length < min) {
        return "👤 Username must be at least $min characters\n"
            "Example: nabeh_yosef";
      }
      if (val.length > max) {
        return "👤 Username can't be more than $max characters";
      }
      if (!RegExp(
        r'^[a-zA-Z]',
      ).hasMatch(val)) {
        return "👤 Username must start with a letter\n"
            "Example: nabeh_yosef";
      }
      if (!RegExp(
        r'^[a-zA-Z][a-zA-Z0-9_.]+$',
      ).hasMatch(val)) {
        return "👤 Username can only contain letters, numbers, _ or .\n"
            "Example: nabeh.yosef_99";
      }
      break;

    case "email":
      if (!GetUtils.isEmail(val)) {
        return "📧 Please enter a valid email address\n"
            "Example: example@gmail.com";
      }
      break;

    case "phone":
      if (!RegExp(
        r'^(\+?\d{7,15})$',
      ).hasMatch(val)) {
        return "📱 Please enter a valid phone number\n"
            "Example: 0991234567 or +963991234567";
      }
      break;

    case "password":
      if (val.length < 8) {
        return "🔒 Password is too short!\n"
            "Must be at least 8 characters";
      }
      if (val.length > max) {
        return "🔒 Password is too long!\n"
            "Can't be more than $max characters";
      }
      if (!RegExp(
        r'[0-9]',
      ).hasMatch(val)) {
        return "🔒 Password must contain at least one number\n"
            "Example: MyPass123";
      }
      if (!RegExp(
        r'[a-zA-Z]',
      ).hasMatch(val)) {
        return "🔒 Password must contain at least one letter\n"
            "Example: MyPass123";
      }
      break;

    case "birthDate":
      if (!RegExp(
        r'^\d{1,2}-\d{1,2}-\d{4}$',
      ).hasMatch(val)) {
        return "📅 Please enter date in this format: DD-MM-YYYY\n"
            "Example: 15-06-2000";
      }
      List<String> parts = val.split(
        "-",
      );
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      if (day < 1 || day > 31) {
        return "📅 Invalid day — must be between 1 and 31";
      }
      if (month < 1 || month > 12) {
        return "📅 Invalid month — must be between 1 and 12";
      }
      if (year < 1900 ||
          year > DateTime.now().year) {
        return "📅 Invalid year — must be between 1900 and ${DateTime.now().year}";
      }
      int currentYear =
          DateTime.now().year;
      if (currentYear - year < 13) {
        return "📅 You must be at least 13 years old to register";
      }
      break;

    default:
      if (val.length < min) {
        return "⚠️ Too short — must be at least $min characters";
      }
      if (val.length > max) {
        return "⚠️ Too long — can't be more than $max characters";
      }
  }

  return null;
}
