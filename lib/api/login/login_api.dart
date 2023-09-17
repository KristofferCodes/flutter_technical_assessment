import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../dio_client.dart';
import '../failure.dart';
import '../type_defs.dart';

final dioInstanceProvider = Provider<Dio>((ref) {
  return Dio();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
});

final loginProvider = Provider((ref) {
  return LoginApi(dioClient: ref.read(dioClientProvider));
});

class LoginApi {
  final DioClient dioClient;
  LoginApi({required this.dioClient});
  FutureEither<Response> login(
    String email,
    String password,
  ) async {
    try {
      final response =
          await dioClient.post('https://dev-api.kooha.com/v1/auth/test/login',
              data: {
                'email': email,
                'password': password,
              },
              options: Options(headers: {
                'Content-Type': 'application/json; charset=UTF-8',
              }));
      print(response);
      return right(response);
    } on DioError catch (e) {
      return left(Failure(e.message));
    }
  }
}
