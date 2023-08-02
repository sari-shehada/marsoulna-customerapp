import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Color? drawerScrimColor;
  final EdgeInsets? bodyPadding;
  final bool resizeToAvoidBottomInset;
  final bool primary;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final double? drawerEdgeDragWidth;

  ///Defaults to `null`, as to not dismiss keyboard on tap
  ///
  ///If set to `true` keyboard will be dismissed on any tap, including captured
  ///
  ///If set to `false` keyboard will be dismissed on any tap, captured excluded
  final bool? dismissKeyboardWithCapturedTaps;
  const CustomScaffold({
    Key? key,
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.drawerScrimColor,
    this.bodyPadding,
    this.resizeToAvoidBottomInset = true,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerEdgeDragWidth,
    this.dismissKeyboardWithCapturedTaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: bodyPadding ?? EdgeInsets.zero,
        child: dismissKeyboardWithCapturedTaps == null
            ? body
            : KeyboardDismissOnTap(
                dismissOnCapturedTaps: dismissKeyboardWithCapturedTaps!,
                child: body ?? const SizedBox.shrink(),
              ),
      ),
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerScrimColor: drawerScrimColor,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
    );
  }
}
