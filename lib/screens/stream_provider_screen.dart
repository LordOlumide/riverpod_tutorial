import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
      const Duration(seconds: 2), ((computationCount) => computationCount));
});

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: streamData.when(
          data: (data) => Center(
                child: Text(
                  data.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              ),
          error: (error, stackTrace) {
            return Text(
              error.toString(),
              style: const TextStyle(color: Colors.red),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
