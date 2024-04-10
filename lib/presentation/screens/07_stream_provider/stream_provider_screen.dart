import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersInChat = ref.watch(usersInChatProvider);

    // if (usersInChat.hasValue) {
    // }

    if (usersInChat.isLoading) {
      return const CircularProgressIndicator();
    }

    if (usersInChat.hasError) {
      return Center(
        child: Text('${usersInChat.error}'),
      );
    }


    //if (usersInChat.hasValue) si no se cumple ninguna de las anteriors hace esto:
    final users = usersInChat.value!;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return ListTile(
          title: Text(user),
        );
      },
    );
  }
}