import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_batch_2/pages/second_page.dart';
import 'package:riverpod_batch_2/providers/names_provider.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int namesCount = ref.watch(myNamesProvider).length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Die Namenslist hat $namesCount Eintraege"),
            const Text("Das ist die Home Page"),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _openPageTwo(context);
              },
              child: const Text('Second Page öffnen'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                ref.watch(myNamesProvider.notifier).addToList("Simon");
              },
              child: const Text('Name hinzufuegen'),
            ),
          ],
        ),
      ),
    );
  }

  void _openPageTwo(BuildContext context) {
    Navigator.restorablePushNamed(context, SecondPage.routeName);
  }
}
