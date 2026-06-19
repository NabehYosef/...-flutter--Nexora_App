import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<Statusrequest, Map>>
  postData(
    String linkurl,
    Map data, {
    String? token,
  }) async {
    if (await CheckInternet()) {
      Map<String, String> headers = {
        "Content-Type":
            "application/json",
      };

      if (token != null &&
          token.isNotEmpty) {
        headers["token"] = token;
      }
      print("=====headerrrrrr=====");
      print(headers);

      var response = await http.post(
        Uri.parse(linkurl),
        headers: headers,
        body: jsonEncode(data),
      );

      print(
        "STATUS CODE = ${response.statusCode}",
      );
      print("BODY = ${response.body}");

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        Map responsebody = jsonDecode(
          response.body,
        );

        return Right(responsebody);
      }

      return const Left(
        Statusrequest.serverfailure,
      );
    }

    return const Left(
      Statusrequest.offlinefailure,
    );
  }
}
