import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(PokemonNameRef ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

  //onDispose permite ejecutar código cuando no se va a usar mas
  //el print sale cuando cerramos el widget
  //tras añadir el keepalive ya no se printea ya que no se destruye
  //pero si el id cambia volvemos a iniciar todo el proceso de construccion del future
  ref.onDispose(() { 
    print('estamos a punto de eliminar este provider');
  });



  return pokemonName;
}

// cuando queremos mantener un estado añadimo una clase
//ojo, tenemos que añadirle el keepalive porque si es autodispose, no podrá usarse en el provder anterior. no podemos tener uno con ondispose y otro sin.
@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  //esto representa el state
  @override
   int build() {
    return 1;
  }

  void nextPokemonId() {
    state++;
  }

  void previousPokemon() {
    if (state > 1) {
      state--;
    }
  }
}

// FAMILY
//antes se llamaba family ahora:
@Riverpod(keepAlive: true)
Future<String> pokemon(PokemonRef ref, int pokemonId) async{
  //family también hace que guarde los estados previos, si ya existen no los solicita a la api de nuevo
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
}

//antes era
// final pokemonOld = FutureProvider.family<Message, String>((ref, id) => async {
//   return dio.get('http://api.com/pokemon/$id');
// })