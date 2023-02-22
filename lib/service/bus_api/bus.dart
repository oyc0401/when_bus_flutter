part of 'inmat_api_library.dart';

class AuthApi {
  /// 시간표 api
  Future<List<Map<String,dynamic>>> history(String date) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "시간표 불러오기",
      path: "/history?date=$date",
    );
    return (await inMatHttp.execute()).cast<Map<String,dynamic>>();
  }

  ///동기화 시작 API
  Future<Map<String, dynamic>> startRepeat() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "동기화 시작",
      path: "/api/start",
    );
    return await inMatHttp.execute();
  }

  ///동기화 시작 API
  Future<Map<String, dynamic>> stopRepeat() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "동기화 시작",
      path: "/api/start",
    );
    return await inMatHttp.execute();
  }

  ///동기화 체크 api
  Future<bool> working() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "동기화 체크",
      path: " /api/working",
    );
    return await inMatHttp.execute();
  }
}
