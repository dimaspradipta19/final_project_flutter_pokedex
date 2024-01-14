import 'package:final_projects_pokemon/data/provider/get_all_pokemon_provider.dart';
import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/ui/detail_screen.dart';
import 'package:final_projects_pokemon/ui/home_screen.dart';
import 'package:final_projects_pokemon/ui/search_screen.dart';
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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        initialRoute: "/",
        routes: {
          "/splashscreen": (context) => const SplashScreen(),
          "/homescreen": (context) => const HomeScreen(),
          "/searchscreen": (context) => const SearchScreen(),
          "/detailscreen": (context) => const DetailScreen(),
        },
      ),
    );
  }
}
