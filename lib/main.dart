import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/screens/counter_screen.dart';
import 'package:riverpod_tutorial/screens/home_screen.dart';
import 'package:riverpod_tutorial/screens/stream_provider_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        'StreamProviderScreen': (context) => const StreamProviderScreen(),
        'CounterScreen': (context) => const CounterScreen(),
      },
    );
  }
}
