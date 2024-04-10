import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

//estoy es un mix de varios providers, como se hacía antes. aquí solo definimos lo que deben hacer los métodos y el código generado se encarga del resto
@riverpod
class Counter extends _$Counter {
  @override
   int build() {
    return 5;
  }

void increaseByOne() {
  state = state + 1;
}

}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void toggleDarkMode() {
    state = !state;
  }
}

//añadiendo keepAlive se mantiene el valor del state aunque salgamos del widget.
@Riverpod(keepAlive: true)
class UserName extends _$UserName {
  @override
  String build() {
    return "Melissa Flores";
  }

  void changeName( String name) {
    state = name;
  }
}