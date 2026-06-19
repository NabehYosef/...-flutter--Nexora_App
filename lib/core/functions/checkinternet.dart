import 'dart:io';

// ignore: strict_top_level_inference, non_constant_identifier_names
CheckInternet() async {
  try {
    var result =
        await InternetAddress.lookup(
          'google.com',
        );
    if (result.isNotEmpty &&
        result[0]
            .rawAddress
            .isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
