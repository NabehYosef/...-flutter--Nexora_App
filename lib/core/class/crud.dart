// lib/core/class/crud.dart

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
      Map<String, String>
      requestHeaders = {
        "Content-Type":
            "application/json; charset=UTF-8",
      };

      // ✅ الـ token يروح في Header بطريقة واحدة فقط
      if (token != null &&
          token.isNotEmpty) {
        requestHeaders["token"] = token;
      }

      print("===== HEADERS =====");
      print(requestHeaders);
      print("===== BODY =====");
      print(data);

      try {
        var response = await http.post(
          Uri.parse(linkurl),
          headers: requestHeaders,
          body: jsonEncode(data),
        );

        print(
          "STATUS CODE = ${response.statusCode}",
        );
        print(
          "BODY = ${response.body}",
        );

        if (response.statusCode >=
                200 &&
            response.statusCode < 300) {
          Map responseBody = jsonDecode(
            response.body,
          );
          print(
            "===== DECODED RESPONSE =====",
          );
          print(responseBody);
          return Right(responseBody);
        }

        print(
          "SERVER ERROR RESPONSE: ${response.body}",
        );
        return const Left(
          Statusrequest.serverfailure,
        );
      } catch (e) {
        print("CRUD ERROR: $e");
        return const Left(
          Statusrequest.serverfailure,
        );
      }
    }

    return const Left(
      Statusrequest.offlinefailure,
    );
  }
}
