import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db_provider.dart';
import 'list_page.dart';
import 'package:provider/provider.dart';
import 'form.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
      ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => DbProvider(),),
      ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => ThemeProvider(isDarkMode : prefs.getBool("isDarkTheme") ?? false),),
    ])
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: ((context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "HALU",
          theme: themeProvider.getTheme,
          home: ListPage(),
        );
      }),
    );
  }
}

// return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => DbProvider(),),
//         ChangeNotifierProvider(
//           builder: (context, child) {
//         final provider = Provider.of<ThemeProvider>(context);
//         return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'HALU',
//         theme: provider.getTheme,
//         home: ListPage(),
//         );
//       },
//           create: (context) => ThemeProvider(isDarkMode : prefs.getBool('isDarkMode')),)
//       ],
//       );