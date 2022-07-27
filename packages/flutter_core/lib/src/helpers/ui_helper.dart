import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UIHelper {
  static void showSnackBar(
    BuildContext context, {
    String? msg,
  }) {
    if (msg == null) return;
    final snackBar = SnackBar(
      content: Text(msg, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.black26,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showLoading() {
    if (!EasyLoading.isShow) {
      EasyLoading.show();
    }
  }

  static void hideLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}
