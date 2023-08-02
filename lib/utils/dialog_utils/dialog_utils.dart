import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../extensions/responsiveness_extensions.dart';

part 'modal_dialog_widget.dart';

class DialogUtils {
  static Future<T> showModalDialog<T>({
    required Widget dialogBody,
    bool withContainer = true,
    ModalDialogContainerDecoration? containerDecoration,
    bool barrierDismissible = true,
    bool useGrowableContainer = false,
    Bindings? bindings,
    ModalDialogHeader? header,
  }) async {
    return await Get.to(
      () => _ModalDialog(
        dialogBody: dialogBody,
        withContainer: withContainer,
        containerDecoration: containerDecoration,
        barrierDismissible: barrierDismissible,
        header: header,
        useGrowableContainer: useGrowableContainer,
      ),
      binding: bindings,
      fullscreenDialog: true,
      transition: Transition.fadeIn,
      opaque: false,
    );
  }

  static Future<T> showRawDialog<T>({
    required Widget dialogBody,
    Bindings? bindings,
  }) async {
    return await Get.to(
      dialogBody,
      binding: bindings,
      fullscreenDialog: true,
      transition: Transition.fadeIn,
      opaque: false,
    );
  }
}
