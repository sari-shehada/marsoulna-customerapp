import 'dart:async';
import 'package:flutter/foundation.dart';
//TODO: Rethink about adding it to network service

///This class is responsible for handling concurrent requests on separate isolates
///to avoid any frame drops.
///
///`Recommendation`: [IsolateService] goal is to be used with network calls mainly.
///
///If you do not know how to use this code wisely, please refer to asking `Ismail-Mohamad-Tayeb`.
abstract class IsolateService {
  ///Resolve a future call in a separate `Isolate`, depending on return value of type [Output] and input
  ///value of type [Input]
  ///
  ///This methods takes a callback that handles a single argument input represented by [argument]
  static Future<Output> resolve<Input, Output>({
    required Future<Output> Function(Input? argument) callback,
    required Input argument,
  }) async {
    Output returnValue = await compute(callback, argument);
    return returnValue;
  }
}
