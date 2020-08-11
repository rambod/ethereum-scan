import 'package:ethereumscan/pages/main_page.dart';
import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  MaterialColor createMaterialColor(Color color) {
//    List strengths = <double>[.05];
//    Map swatch = <int, Color>{};
//    final int r = color.red, g = color.green, b = color.blue;
//
//    for (int i = 1; i < 10; i++) {
//      strengths.add(0.1 * i);
//    }
//    strengths.forEach((strength) {
//      final double ds = 0.5 - strength;
//      swatch[(strength * 1000).round()] = Color.fromRGBO(
//        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//        1,
//      );
//    });
//    return MaterialColor(color.value, swatch);
//  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MainProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ethereum Scan',
        theme: ThemeData(

//        primarySwatch: createMaterialColor(Color(0xFF270378)),
          primarySwatch: MaterialColor(
              Colors.grey.shade300.value,
              {
                50: Colors.grey.shade50,
                100: Colors.grey.shade100,
                200: Colors.grey.shade200,
                300: Colors.grey.shade300,
                400: Colors.grey.shade400,
                500: Colors.grey.shade500,
                600: Colors.grey.shade600,
                700: Colors.grey.shade700,
                800: Colors.grey.shade800,
                900: Colors.grey.shade900
              }
          ),
          fontFamily: 'OpenSans',
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              fontWeight: FontWeight.normal
            )
          ),
        ),
        home: MainPage(),
      ),
    );
  }
}


