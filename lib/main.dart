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

  // This widget is the root of your application.
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
        // ChangeNotifierProvider(
        //   create: (context) => GetAllPokemonProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        // initialRoute: "/",
        // routes: {
        //   "/splashscreen": (context) => const SplashScreen(),
        //   "/homescreen": (context) => const HomeScreen(),
        //   "/searchscreen": (context) => const SearchScreen(),
        //   "/detailscreen": (context) => const DetailScreen(namePokemon: namePokemon),
        // },
      ),
    );
  }
}
