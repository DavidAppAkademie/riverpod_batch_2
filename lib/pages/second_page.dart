import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_batch_2/providers/activity_provider.dart';
import 'package:riverpod_batch_2/providers/names_provider.dart';

class SecondPage extends ConsumerWidget {
  static const routeName = '/SecondPage';
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namesList = ref.watch(myNamesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.invalidate(fetchActivityProvider);
                },
                child: const Text("Neu laden")),
            ref.watch(fetchActivityProvider).when(
              data: (activity) {
                return Column(
                  children: [
                    Text(activity.activity),
                    Text("Das Ganze kostet: ${activity.price}"),
                  ],
                );
              },
              error: (error, stackTrace) {
                return Text("Es gibt nen Fehler: $error");
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
            const Text("Das ist die Second Page"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: namesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(namesList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      ref
                          .read(myNamesProvider.notifier)
                          .removeFromList(namesList[index]);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
