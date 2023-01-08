import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'geo_locator_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isRunning = true;
  @override
  void didChangeDependencies() {
    if (_isRunning) {
      super.didChangeDependencies();
      splashScreen();
    }
    _isRunning = false;
  }

  Future<void> splashScreen() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return _isLoading ? SplashScreen() : GeoLocatorScreen();
  }
}
