import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/failure.dart';

abstract class AppClient {
  Future<Either<Failure, dynamic>> call(
    String path, {
    required RestfulMethod method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });
}

enum RestfulMethod { get, post, put }

class AppClientImpl extends AppClient {
  final Dio? dio;

  AppClientImpl({
    this.dio,
  });

  @override
  Future<Either<Failure, dynamic>> call(
    String path, {
    required RestfulMethod method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    if (dio == null) {
      return const Left(Failure(code: 1000));
    }
    try {
      Response<dynamic>? response;
      if (method == RestfulMethod.get) {
        response = await dio?.get(path, queryParameters: queryParameters);
      } else if (method == RestfulMethod.post) {
        response = await dio?.post(path, data: data);
      } else if (method == RestfulMethod.put) {
        response = await dio?.put(path, data: data);
      }
      return _parseResponse(
        response,
      );
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const Left(Failure(code: 2000));
      }
      return _parseResponse(e.response);
    } catch (error) {
      return const Left(Failure(code: 500));
    }
  }

  Either<Failure, dynamic> _parseResponse(
    Response<dynamic>? response,
  ) {
    if (response == null) {
      return const Left(Failure(code: 500));
    }
    if (response.statusCode != 200 && response.statusCode != 201) {
      if (response.statusCode == 401) {
        // Logout
      }
      return Left(
        Failure(
          code: response.statusCode,
          message: response.statusMessage,
        ),
      );
    }
    return Right(response.data);
  }
}
