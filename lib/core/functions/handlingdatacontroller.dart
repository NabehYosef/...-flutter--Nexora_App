import 'package:e_commerce/core/class/statusrequest.dart';

// ignore: strict_top_level_inference
handlingData(response) {
  if (response ==
      Statusrequest.serverfailure) {
    return response;
  } else {
    return Statusrequest.success;
  }
}
