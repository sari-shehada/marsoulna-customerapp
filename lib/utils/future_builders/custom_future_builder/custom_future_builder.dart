import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T?> future;
  final Widget Function(T? data) onDataLoadedSuccessfully;
  final Widget? dataLoadingFailedWidget;
  final Widget? dataLoadingWidget;
  final Widget? emptyListWidget;

  const CustomFutureBuilder({
    super.key,
    required this.future,
    required this.onDataLoadedSuccessfully,
    this.dataLoadingFailedWidget,
    this.dataLoadingWidget,
    this.emptyListWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.waiting) {
          return dataLoadingWidget ??
              const Center(child: CircularProgressIndicator());
        }

        if ((snapshot.connectionState == ConnectionState.done &&
                snapshot.hasError) ||
            snapshot.data == null) {
          return dataLoadingFailedWidget ??
              _errorMessageBuilder('Loading Data Failed');
        }

        if (snapshot.data is List && (snapshot.data as List).isEmpty) {
          return emptyListWidget ??
              _errorMessageBuilder('Loaded An Empty List');
        }

        return onDataLoadedSuccessfully(snapshot.data);
      },
    );
  }

  Widget _errorMessageBuilder(String message) {
    const TextStyle style =
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
    return Center(
      child: Text(message, style: style),
    );
  }
}
