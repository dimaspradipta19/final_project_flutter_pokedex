import 'package:final_projects_pokemon/data/provider/get_all_pokemon_provider.dart';
import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetAllPokemonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetNamePokemonProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Pokedex Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
