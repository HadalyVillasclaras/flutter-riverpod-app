import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'stream_provider.g.dart';

@Riverpod(keepAlive: true)    
Stream<List<String>> usersInChat(UsersInChatRef ref) async*{ //con el * indicamos que es una función generadora que estará emitiendo valores de un string
  
  final names = <String>[];
  // yield names;

//cada vez que el randomname emite un valor se acumula en la lista
  await for (final name in RandomGenerator.randomNameStream()) {
    names.add(name);
    yield names;
  }

}