import 'package:flutter/material.dart';
import 'package:preferences/providers/theme_provider.dart';
import 'package:preferences/screens/screens.dart';
import 'package:preferences/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //inicializa las variables para evitar que nos mande el error de null
  //el await necesita que seam inicializadas las variables en Preferences
  await Preferences.init();
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode),
      )
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          SettingsScreen.routeName: (_) => const SettingsScreen()
        },
        theme: Provider.of<ThemeProvider>(context).currentTheme);
  }
}
