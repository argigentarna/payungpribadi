import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/presentation/provider/app_notifier.dart';
import 'package:payungpribadi/presentation/provider/home_menu_notifier.dart';
import 'package:payungpribadi/presentation/provider/menu_notifier.dart';
import 'package:payungpribadi/presentation/provider/personal_data_notifier.dart';
import 'package:payungpribadi/presentation/screen/main_screen.dart';
import 'package:payungpribadi/presentation/screen/personal_screen.dart';
import 'package:payungpribadi/presentation/screen/profile_screen.dart';
import 'package:payungpribadi/presentation/screen/splash_screen.dart';
import 'package:payungpribadi/presentation/screen/under_construction_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppNotifier(this),
        ),
        ChangeNotifierProvider(
          create: (_) => MenuNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeMenuNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => PersonalDataNotifier(),
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
          '/main_screen': (context) => const MainScreen(),
          '/under_construction_screen': (context) =>
              const UnderConstructionScreen(),
          '/profile_screen': (context) => const ProfileScreen(),
          '/personal_screen': (context) => const PersonalScreen(),
        },
      ),
    );
  }
}
