import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/color_schemes.g.dart';
import 'package:vendor_app/firebase_options.dart';
import 'package:vendor_app/screens/auth_gate.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Vendor App',
      home: AuthGate(),
    );
  }
}