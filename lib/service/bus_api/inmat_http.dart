import 'dart:developer' as developer;

import 'http_module.dart';
import '../exception/inmat_exception.dart';

enum Http { get, post, patch, delete }

class InMatHttp {
  InMatHttp(
    this.how, {
    required this.path,
    required this.message,
    this.body,
    this.token,
    this.refreshToken,
    this.deviceIdentifier,
  });

  Http how;
  String path;
  String message;
  Map? body;
  String? token;
  String? refreshToken;
  String? deviceIdentifier;

  String get url => "http://3.36.184.88:8080$path";

  dynamic execute() async {
    developer.log("π $message μ€...", name: "http");

    Map<String, String> header = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      // "Device-Identifier": '$deviceIdentifier',
      // "REFRESH-TOKEN": '$refreshToken',
      // // "User-Agent": deviceIdentifier,
    };

    Map request = {};

    switch (how) {
      case Http.get:
        request = await HttpModule.get(url: url, headers: header);
        break;
      case Http.post:
        request = await HttpModule.post(url: url, body: body, headers: header);
        break;
      case Http.patch:
        request = await HttpModule.patch(url: url, body: body, headers: header);
        break;
      case Http.delete:
        request = await HttpModule.delete(url: url, headers: header);
        break;
    }

    /// λλ²κ·Έ ν  λ [debug]λ₯Ό true λ‘ νλ©΄ λͺ¨λ  ν΅μ μ κ°μ μΆλ ₯νλ€.
    const bool debug = true;
    if (debug) developer.log("βοΈ $request", name: "http");

    _throwException(request);

    developer.log("β $message μ±κ³΅!", name: "http");

    return request["result"];
  }

  void _throwException(Map response) {
    if (response['isSuccess'] == false) {
      developer.log("β $message μ€ν¨!", name: "http");
      int code = response['code'];
      switch (code) {
        case 401:
          throw ExpirationAccessToken();
        case 403:
          throw AccessDenied();
        case 2000:
          throw Invalidate();
        case 2004:
          throw ExpirationRefreshToken();
        case 3010:
          throw SignInFailed();
        case 3030:
          throw OverlappingAccount();
        case 3035:
          throw OverlappingNickName();
        case 4000:
          throw DataBaseFailed();
        default:
          throw Exception(
              'Failed to $message: status: ${response['code']}, message: ${response['message']}');

        // Failed to κ²μκΈ μ­μ : 3200, κ²μκΈ μ­μ μ μ€ν¨νμμ΅λλ€.
      }
    }
  }
}
