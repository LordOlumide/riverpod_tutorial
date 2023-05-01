import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelloNotifier extends StateNotifier<String> {
  HelloNotifier() : super('Hello world');

  int num = 0;

  void addZero() {
    state = '$state $num';
    num += 1;
  }
}
