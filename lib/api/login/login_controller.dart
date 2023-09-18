import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/ui_server.dart';
import '../../utilities.dart';
import 'login_api.dart';

String? token;

final loginControllerProvider =
    StateNotifierProvider<LoginController, bool>((ref) {
  return LoginController(loginApi: ref.watch(loginProvider));
});

class LoginController extends StateNotifier<bool> {
  final LoginApi _loginApi;

  LoginController({required loginApi})
      : _loginApi = loginApi,
        super(false);

  void login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    state = true;
    final res = await _loginApi.login(email, password);
    state = false;
    res.fold((l) {
      failureSnackBar(context, l.message);
    }, (r) {
      successSnackBar(context, r.data['message'].toString());
      token = r.data['data']['token'];
      // print(token);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeView()));
    });
  }
}
