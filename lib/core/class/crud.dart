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

  //====================GetData============================
  Future<Either<Statusrequest, Map>>
  getData(
    String linkurl, {
    Map<String, String>? queryParams,
    String? token,
  }) async {
    if (await CheckInternet()) {
      Map<String, String>
      requestHeaders = {
        "Content-Type":
            "application/json; charset=UTF-8",
      };

      if (token != null &&
          token.isNotEmpty) {
        requestHeaders["token"] = token;
      }
      Uri uri = Uri.parse(linkurl);
      if (queryParams != null) {
        uri = uri.replace(
          queryParameters: queryParams,
        );
      }

      print("===== GET REQUEST =====");
      print(uri.toString());

      try {
        var response = await http.get(
          uri,
          headers: requestHeaders,
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

  //===========================Delete Data=========================
  Future<Either<Statusrequest, Map>>
  deleteData(
    String linkurl, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    if (await CheckInternet()) {
      Map<String, String>
      requestHeaders = {
        "Content-Type":
            "application/json; charset=UTF-8",
      };

      if (token != null &&
          token.isNotEmpty) {
        requestHeaders["token"] = token;
      }

      try {
        var response = await http
            .delete(
              Uri.parse(linkurl),
              headers: requestHeaders,
              body: body != null
                  ? jsonEncode(body)
                  : null,
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
          return Right(responseBody);
        }

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

  //====================PatchData============================
  Future<Either<Statusrequest, Map>>
  patchData(
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

      if (token != null &&
          token.isNotEmpty) {
        requestHeaders["token"] = token;
      }

      try {
        var response = await http.patch(
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
          return Right(responseBody);
        }

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

  //==================PUT Data=========================
  Future<Either<Statusrequest, Map>>
  putData(
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

      if (token != null &&
          token.isNotEmpty) {
        requestHeaders["token"] = token;
      }

      try {
        var response = await http.put(
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
          return Right(responseBody);
        }

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

  //====================PutData support upload photo
  Future<Either<Statusrequest, Map>>
  putMultipartData(
    String linkurl,
    Map<String, String> fields, {
    String? token,
    String? imageField,
    String? imagePath,
  }) async {
    if (await CheckInternet()) {
      try {
        var request =
            http.MultipartRequest(
              'PUT',
              Uri.parse(linkurl),
            );

        if (token != null &&
            token.isNotEmpty) {
          request.headers["token"] =
              token;
        }

        request.fields.addAll(fields);

        if (imageField != null &&
            imagePath != null) {
          request.files.add(
            await http
                .MultipartFile.fromPath(
              imageField,
              imagePath,
              contentType:
                  http.MediaType(
                    'image',
                    'jpeg',
                  ),
            ),
          );
        }

        var streamedResponse =
            await request.send();
        var response =
            await http
                .Response.fromStream(
              streamedResponse,
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
