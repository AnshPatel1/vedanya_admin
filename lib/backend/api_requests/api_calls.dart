import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginAuthCall {
  static Future<ApiCallResponse> call({
    String username = '',
    String passwd = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'loginAuth',
      apiUrl: 'http://143.110.180.215/api/app/login/admin',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'username': username,
        'passwd': passwd,
      },
      returnBody: true,
    );
  }
}

class GetRecentSBLRsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getRecentSBLRs',
      apiUrl: 'http://143.110.180.215/api/sblrs?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic reversed(dynamic response) => getJsonField(
        response,
        r'''$[-6:]''',
      );
}

class GetMSObyIdCall {
  static Future<ApiCallResponse> call({
    int id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMSObyId',
      apiUrl: 'http://143.110.180.215/api/msos/id',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
    );
  }
}

class GetMSOSCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getMSOS',
      apiUrl: 'http://143.110.180.215/api/msos',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic lastMSOName(dynamic response) => getJsonField(
        response,
        r'''$[-1].name''',
      );
}

class GetSBLRAsPairsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getSBLRAsPairs',
      apiUrl: 'http://143.110.180.215/api/sblrsaspairs?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
