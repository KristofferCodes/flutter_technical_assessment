import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_assessment/api/transactions/transaction_api.dart';
import '../../models/transaction_model.dart';
import '../../models/wallet_model.dart';
import '../dio_exception.dart';

final transactionControllerProvider =
    StateNotifierProvider<TransactionController, bool>((ref) {
  return TransactionController(transactionApi: ref.watch(transactionProvider));
});

final getTransactionProvider = FutureProvider.autoDispose((ref) async {
  final transactionController =
      ref.watch(transactionControllerProvider.notifier);
  return transactionController.getTransactions();
});

final walletInfoProvider = FutureProvider.autoDispose((ref) {
  final promotionController = ref.watch(transactionControllerProvider.notifier);
  return promotionController.getWalletInfo();
});

class TransactionController extends StateNotifier<bool> {
  final TransactionApi _transactionApi;

  TransactionController({required transactionApi})
      : _transactionApi = transactionApi,
        super(false);
  Future<WalletInfo> getWalletInfo() async {
    final response = await _transactionApi.getWalletInfo();
    print(response);
    return response;
  }

  Future<List<Transactions>> getTransactions() async {
    try {
      final response = await _transactionApi.getTransactions();
      final leaveRoaster = (response.data['data']['records'] as List)
          .map((e) => Transactions.fromJson(e))
          .toList();
      print(leaveRoaster);
      return leaveRoaster;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
