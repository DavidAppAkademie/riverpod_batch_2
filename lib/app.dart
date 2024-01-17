import 'package:flutter/material.dart';
import 'package:riverpod_batch_2/pages/home_page.dart';
import 'package:riverpod_batch_2/pages/second_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case SecondPage.routeName:
              return const SecondPage();
            default:
              return const HomePage();
          }
        });
      },
    );
  }
}
