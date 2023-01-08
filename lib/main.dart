import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import './providers/transaction_provider.dart';
import './screens/geo_locator_screen.dart';
import './screens/payment_screen.dart';
import './screens/payment_success_screen.dart';
import './screens/permanent_address_screen.dart';
import './screens/personal_information_screen.dart';
import './screens/print_slip_screen.dart';
import './screens/splash_screen.dart';
import './screens/temporary_address_screen.dart';
import './screens/user_login_screen.dart';
import './screens/vehicle_information_screen.dart';
import './screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkModeEnabeled = false;
  @override
  Widget build(BuildContext context) {
    void onStateChanged(bool isDarkMode) {
      print('Switching');
      setState(() {
        isDarkModeEnabeled = isDarkMode;
      });
      print(isDarkModeEnabeled);
    }

    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: KhaltiScope(
        publicKey: 'test_public_key_c89b73a294164cb88c021b4068c736fa',
        builder: (context, navigatorKey) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            darkTheme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
                  .copyWith(secondary: Colors.white),
              scaffoldBackgroundColor: Color.fromARGB(255, 35, 44, 51),
              errorColor: Color.fromARGB(255, 156, 50, 42),
              focusColor: Color.fromARGB(255, 216, 208, 208),
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Color.fromARGB(255, 243, 240, 240),
              ),
            ),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
                  .copyWith(secondary: Colors.white),
              scaffoldBackgroundColor: Color(0xFF3685CE),
              errorColor: Colors.red,
              focusColor: Colors.white,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.grey,
              ),
            ),
            themeMode: isDarkModeEnabeled ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            routes: {
              GeoLocatorScreen.routeName: (context) => GeoLocatorScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              PaymentScreen.routeName: (context) => PaymentScreen(),
              PaymentSuccessScreen.routeName: (context) =>
                  PaymentSuccessScreen(),
              PermanentAddressScreen.routeName: (context) =>
                  PermanentAddressScreen(),
              PersonalInformationScreen.routeName: (context) =>
                  PersonalInformationScreen(),
              PrintSlipScreen.routeName: (context) => PrintSlipScreen(),
              SplashScreen.routeName: (context) => SplashScreen(),
              TemporaryAddressScreen.routeName: (context) =>
                  TemporaryAddressScreen(),
              UserloginScreen.routeName: (context) => UserloginScreen(
                    themeChanger: onStateChanged,
                    isDarkMode: isDarkModeEnabeled,
                  ),
              VehicleInformationScreen.routeName: (context) =>
                  VehicleInformationScreen(),
            },
          );
        },
      ),
    );
  }
}
