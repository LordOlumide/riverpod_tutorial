import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/providers/counter_state_notifier.dart';

final counterProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  // ref.keepAlive();
  final KeepAliveLink link = ref.keepAlive();
  final Timer timer = Timer(const Duration(seconds: 10), () {
    link.close();
  });

  ref.onDispose(() => timer.cancel());
  return CounterDemo();
});

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Text(
          counter.toString(),
          style: const TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
