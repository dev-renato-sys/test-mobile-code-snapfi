import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapfi_app/src/pages/pokemon_home_page.dart';
import './injection_container.dart' as ic;
import 'src/bloc/pokemon/bloc.dart';
import 'src/bloc/pokemon/event.dart';
import 'src/routes/index.dart';
import 'src/theme/dark.dart';
import 'src/theme/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Quali APP',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: routes,
      home: BlocProvider<PokemonBloc>(
        create: ((context) => ic.sl<PokemonBloc>()..add(PokemonFetchList())),
        child: PokemonHomePage(key: key),
      ),
    );
  }
}
