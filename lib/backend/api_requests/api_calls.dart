import 'api_manager.dart';

Future<dynamic> algKayitGetCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'alg kayit get',
    apiUrl:
        'https://c18ym5ghk0.algolia.net/1/indexes/user_kayit/browse?X-Algolia-API-Key=9a338691945075342385d94e1467d081&X-Algolia-Application-Id=C18YM5GHK0',
    callType: ApiCallType.GET,
    headers: {},
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> algSpGetCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'alg sp get',
    apiUrl:
        'https://C18YM5GHK0.algolia.net/1/indexes/sp/browse?query=1021889&X-Algolia-API-Key=9a338691945075342385d94e1467d081&X-Algolia-Application-Id=C18YM5GHK0',
    callType: ApiCallType.GET,
    headers: {},
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> algffusersCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'algffusers',
    apiUrl:
        'https://8tpmpzux5g.algolia.net/1/indexes/users/browse?X-Algolia-API-Key=2292e093253b0eb58dffbc18f872a98d&X-Algolia-Application-Id=8TPMPZUX5G',
    callType: ApiCallType.GET,
    headers: {},
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> mathCall({
  int ikinci = 50,
  int ilk = 100,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'math',
    apiUrl: 'https://api.mathjs.org/v4/?expr=',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'ikinci': ikinci,
      'ilk': ilk,
    },
    returnResponse: true,
  );
}

Future<dynamic> mathpostCall({
  int ilk = 100,
  int ikinci = 50,
}) {
  final body = '''
{
  "expr": [
    "$ilk     -$ikinci"
  ],
  "precision": 0
}''';
  return ApiManager.instance.makeApiCall(
    callName: 'mathpost',
    apiUrl: 'http://api.mathjs.org/v4/',
    callType: ApiCallType.POST,
    headers: {},
    params: {
      'ilk': ilk,
      'ikinci': ikinci,
    },
    body: body,
    bodyType: BodyType.JSON,
    returnResponse: true,
  );
}

Future<dynamic> algSpGetIdBaseCall({
  String query = '1021889',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'alg sp get id base',
    apiUrl:
        'https://C18YM5GHK0.algolia.net/1/indexes/sp/browse?X-Algolia-API-Key=9a338691945075342385d94e1467d081&X-Algolia-Application-Id=C18YM5GHK0',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'query': query,
    },
    returnResponse: true,
  );
}

Future<dynamic> algPostCall({
  String id = 'e8fd931b-8f43-4317-928b-5109e0b6eff7',
}) {
  final body = '''
{
  "params": "filters=user_id:$id"
}''';
  return ApiManager.instance.makeApiCall(
    callName: 'alg post',
    apiUrl:
        'https://C18YM5GHK0.algolia.net/1/indexes/sp/browse?X-Algolia-API-Key=9a338691945075342385d94e1467d081&X-Algolia-Application-Id=C18YM5GHK0',
    callType: ApiCallType.POST,
    headers: {},
    params: {
      'id': id,
    },
    body: body,
    bodyType: BodyType.JSON,
    returnResponse: true,
  );
}
