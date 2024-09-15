import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/presentation/provider/app_notifier.dart';
import 'package:payungpribadi/presentation/screen/main_screen.dart';
import 'package:payungpribadi/presentation/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
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
          create: (_) => AppNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.black, displayColor: Colors.black),
          ),
        ),
        home: const SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/main_screen': (context) => MainScreen(),
        },
      ),
    );
  }
}
