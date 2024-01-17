import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'names_provider.g.dart';

@Riverpod(keepAlive: true)
class MyNames extends _$MyNames {
  @override
  List<String> build() {
    // Standardwert leere Liste
    return [];
  }

  // Methode
  void addToList(String name) {
    state = [...state, name];
  }

  void removeFromList(String name) {
    state = [...state]..remove(name);
  }
}
