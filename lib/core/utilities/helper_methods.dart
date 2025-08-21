import 'package:flutter/foundation.dart';
// ---------------------
void asyncInSync(Function? asynchronous) {
  if (asynchronous != null) {
    Future<void> _start() async {}

    _start().then((_) async {
      await asynchronous();
    });
  }
}
// --------------------
/// TESTED : WORKS PERFECT
void blog(dynamic msg, {String? invoker}) {
  assert(() {
    if (kDebugMode) {
      debugPrint(msg?.toString());
    }
    return true;
  }(), '_');
}
// --------------------
