import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/provider/darkModeProvider.dart';
import 'package:walkmate/provider/dataProvider.dart';
import 'package:walkmate/provider/notificationProvider.dart';
import 'package:walkmate/screens/get_started.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkModeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => DataProvider(
            notificationProvider: context.read<NotificationProvider>(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor primarySwatch = const MaterialColor(
    0xFF20C56C, // Hex color code #20C56C
    <int, Color>{
      50: Color(0xFFD1F6E2),
      100: Color(0xFFA3ECC3),
      200: Color(0xFF75E2A4),
      300: Color(0xFF46D985),
      400: Color(0xFF24CD6E),
      500: Color(0xFF20C56C),
      600: Color(0xFF1DBD67),
      700: Color(0xFF18B35F),
      800: Color(0xFF15AB56),
      900: Color(0xFF0E9B45),
    },
  );

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(
      context,
    ).getMode();
    final isDarkMode = Provider.of<DarkModeProvider>(context).isModeDark;
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      // theme: ThemeData(primarySwatch: primarySwatch),
      debugShowCheckedModeBanner: false,
      title: 'WalkMate',
      home: const GetStarted(),
    );
  }
}
