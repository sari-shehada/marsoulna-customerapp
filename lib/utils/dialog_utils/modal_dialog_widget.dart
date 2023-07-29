part of 'dialog_utils.dart';

class _ModalDialog extends StatelessWidget {
  const _ModalDialog({
    required this.dialogBody,
    this.header,
    this.withContainer = true,
    this.containerDecoration,
    this.barrierDismissible = true,
    this.useGrowableContainer = false,
  });

  final Widget dialogBody;
  final bool withContainer;
  final ModalDialogContainerDecoration? containerDecoration;
  final bool barrierDismissible;
  final ModalDialogHeader? header;
  final bool useGrowableContainer;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(.6),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AbsorbPointer(
            absorbing: !barrierDismissible,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => Get.back(),
            ),
          ),
          Center(
            child: _buildDialog(),
          ),
        ],
      ),
    );
  }

  Widget _buildDialog() {
    assert(
      (!withContainer && containerDecoration == null) || (withContainer),
      'Don\'t Provide "Container Decoration when a container is not being used"',
    );
    if (withContainer) {
      return _buildContainer();
    }
    return _buildChild();
  }

  Container _buildContainer() {
    if (containerDecoration != null) {
      assert(
          (!useGrowableContainer ||
              (useGrowableContainer && containerDecoration!.height == null)),
          'Don\'t use a growable container when providing an explicit height to the container');
    }
    return Container(
      height: containerDecoration?.height ??
          (useGrowableContainer
              ? null
              : _ModalDialogContainerDecorationConstants.defaultHeight),
      width: containerDecoration?.width ??
          _ModalDialogContainerDecorationConstants.defaultWidth,
      margin: containerDecoration?.margin,
      constraints: containerDecoration?.constraints,
      padding: containerDecoration?.padding ??
          _ModalDialogContainerDecorationConstants.defaultPadding,
      decoration: containerDecoration?.boxDecoration ??
          _ModalDialogContainerDecorationConstants.defaultDecoration,
      alignment: containerDecoration?.alignment ??
          (useGrowableContainer
              ? null
              : _ModalDialogContainerDecorationConstants.defaultAlignment),
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    if (header == null) {
      return dialogBody;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30.responsiveFromHeight,
          width: double.infinity,
          child: Row(
            children: [
              Text(
                header!.headerTitle,
                style: Get.textTheme.titleMedium,
              ),
              const Spacer(),
              header!.hasCloseButton
                  ? InkWell(
                      onTap: Get.back,
                      child: const Icon(
                        Icons.cancel,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
        dialogBody,
      ],
    );
  }
}

class _ModalDialogContainerDecorationConstants {
  static double defaultHeight = 300.responsiveFromHeight;
  static double defaultWidth = 300.responsiveFromWidth;
  static EdgeInsets get defaultPadding => EdgeInsets.symmetric(
        vertical: 10.responsiveFromHeight,
        horizontal: 20.responsiveFromWidth,
      );

  static BoxDecoration get defaultDecoration => BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          14.responsiveFromRadius,
        ),
      );

  static Alignment get defaultAlignment => Alignment.topCenter;
}

class ModalDialogContainerDecoration {
  ModalDialogContainerDecoration({
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.boxDecoration,
    this.constraints,
    this.alignment,
  });
  double? height;
  double? width;
  EdgeInsets? margin;
  EdgeInsets? padding;
  BoxDecoration? boxDecoration;
  BoxConstraints? constraints;
  Alignment? alignment;
}

class ModalDialogHeader {
  ModalDialogHeader({
    required this.headerTitle,
    this.hasCloseButton = true,
  });
  final String headerTitle;
  final bool hasCloseButton;
}
