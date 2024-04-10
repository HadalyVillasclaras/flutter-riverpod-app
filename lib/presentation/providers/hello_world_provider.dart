import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world_provider.g.dart'; //sintaxis para archivos auto generados

//cuando son providers simple de solo lectura no necesitamos crear clases
@riverpod
String helloWorld(HelloWorldRef ref) {
  return "Hola mundo";
}