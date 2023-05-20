import 'package:dio/dio.dart';

class ExceptionsInfos {
  final String message;
  final int? statusCode;

  ExceptionsInfos({required this.message, this.statusCode});
}

class HttpHelper {
  late Response? response;
  late String url;
  late Object? data;
  late Options? headers;
  Exception? exception;
  DioError? dioError;
  late ExceptionsInfos exceptionsInfos;

  HttpHelper({required this.url, this.data, this.headers});

  dynamic getData() {
    return response!.data;
  }

  int getStatusCode() {
    return response!.statusCode ?? 500;
  }

  Response getResponse() {
    return response!;
  }

  Future<HttpHelper> get() async {
    await dio(method: 'get', url: url, data: data, headers: headers);
    return this;
  }

  Future<HttpHelper> put() async {
    await dio(method: 'put', url: url, data: data, headers: headers);
    return this;
  }

  Future<HttpHelper> post() async {
    await dio(method: 'post', url: url, data: data, headers: headers);
    return this;
  }

  Future<HttpHelper> delete() async {
    await dio(method: 'delete', url: url, data: data, headers: headers);
    return this;
  }

  Future<Response> dio(
      {String? method = 'get',
      required String url,
      Object? data,
      Options? headers}) async {
    Map<String, Function> methods = {
      'get': () => Dio().get(url, data: data, options: headers),
      'put': () => Dio().put(url, data: data, options: headers),
      'post': () => Dio().post(url, data: data, options: headers),
      'delete': () => Dio().delete(url, data: data, options: headers),
    };

    try {
      response = await methods[method]?.call();
    } on DioError catch (e) {
      dioError = e;
    } on Exception catch (e) {
      exception = e;
    }

    return response!;
  }

  bool hasExcepion() {
    return dioError != null || exception != null;
  }

  ExceptionsInfos getExceptionMessage() {
    return ExceptionsInfos(
        message: dioError?.response?.data ?? 'Not mapped',
        statusCode: dioError?.response?.statusCode);
  }
}
