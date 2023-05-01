import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/hello_world_provider.dart';
import 'package:riverpod_tutorial/models/user_model.dart';
import 'package:riverpod_tutorial/services/api_service.dart';

final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider = FutureProvider<List<UserModel>>(
  (ref) {
    return ref.read(apiProvider).getUser();
  },
);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing userData'),
      ),
      body: userData.when(data: (data) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${data[index].first_name} ${data[index].last_name}'),
              subtitle: Text(data[index].email),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data[index].avatar),
              ),
            );
          },
          itemCount: data.length,
        );
      }, error: (error, stacktrace) {
        return Center(
          child: Text(
            error.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        );
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
