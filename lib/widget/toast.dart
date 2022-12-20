import 'package:fluttertoast/fluttertoast.dart';

import 'constant.dart';

class Toast {
  showToast(String? msg) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        webBgColor: "linear-gradient(to right, #319416, #319416)",
        textColor: AppColors.White,
        webPosition: 'center');
  }

  errorToast(
    String? msg,
  ) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        textColor: AppColors.White,
        webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
        webPosition: 'center');
  }
}
