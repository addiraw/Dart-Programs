// Copyright (c) 2015, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
  int i = 0;
  while (true) {
    await Future.delayed(interval);
    // yield i++;
    var a = DateTime.now().second;
    yield DateTime.now().second;
    if (a == maxCount) break;
  }
}

void listenAfterDelay() async {
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  await Future.delayed(const Duration(seconds: 5));
// dartLanguagePrograms();
  // After 5 seconds, add a listener.
  await for (int n in counterStream) {
    print(n); // Print an integer every second, 15 times.
  }
}

Future<String> f() async {
  await Future.delayed(const Duration(seconds: 1));
  DateTime.now().toString();
  print(DateTime.now());
}

// }
main() async {
  listenAfterDelay();
  // var stream = countStream(10);
  // var sum = await sumStream(stream);
  // print(sum); // 55
  // print(DateTime.now().weekday.toString());
}
