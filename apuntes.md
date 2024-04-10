Instalar dependencias

flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint


Desde la doc de river, para temas de anotaciones etc, recomiendan: 
flutter pub run build_runner watch
Cada que un archivo con anotaciones cambie y se guarde, lo vuelve a generar.


watch / read
    //el watch redibuja widgets. dentro de metodos no se puede hacer. si queremos usarlo dentro de un método debemos usar read


Los datos de los estados de los providers se destruyen cuando se sale(destruye, unmout) del widget, pero si por ejemplo, tenemos el provider en un nivel superior no se destruirá si navegamos entre widgets.
ejemplo, el provider de theme en el main

Para mantener un estado de un provider se usa
# keepAlive

family permite enviar arg. si el arg es el mismo y ya tenia resolcuion de un future utilizan el mismo valor.