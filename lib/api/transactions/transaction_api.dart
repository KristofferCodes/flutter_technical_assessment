import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../features/wallet/wallet.dart';
import '../../models/wallet_model.dart';
import '../dio_client.dart';
import '../dio_exception.dart';
import '../failure.dart';
import '../login/login_controller.dart';
import '../type_defs.dart';

final dioInstanceProvider = Provider<Dio>((ref) {
  return Dio();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
});

final transactionProvider = Provider((ref) {
  return TransactionApi(dioClient: ref.read(dioClientProvider));
});

class TransactionApi {
  final DioClient dioClient;

  TransactionApi({required this.dioClient});
  Future<WalletInfo> getWalletInfo() async {
    try {
      final Response response =
          await dioClient.get('https://dev-api.kooha.com/v1/wallets/test',
              options: Options(headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token'
              }));
      // print(response.data['data']);
      return WalletInfo.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getTransactions() async {
    try {
      final response =
          await dioClient.get('https://dev-api.kooha.com/v1/transactions',
              options: Options(headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token'
              }));
      print(response);
      return response;
    } on DioError catch (e) {
      print(e);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
