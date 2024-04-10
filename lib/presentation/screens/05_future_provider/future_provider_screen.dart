import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //no tenemos el nombre del pokemon, tenemos un async value. este valor puede tener 3 valores, completo, cargando o error
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data), 
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('$error')
          ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon( Icons.refresh ),
            onPressed: () { 
              //esto invalida el keepalive y hará que salte el ondispose
              // ref.invalidate(pokemonNameProvider);         
              ref.read(pokemonIdProvider.notifier).nextPokemonId();
              },
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: 'btn-2',

            child: const Icon( Icons.minimize ),
            onPressed: () { 
              //esto invalida el keepalive y hará que salte el ondispose
              // ref.invalidate(pokemonNameProvider);         
              ref.read(pokemonIdProvider.notifier).previousPokemon();
              },
          ),
        ],
      ),
    );
  }
}