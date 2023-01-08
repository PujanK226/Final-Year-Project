import 'user_login_screen.dart';
import '../providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class GeoLocatorScreen extends StatefulWidget {
  static const routeName = '/geolocator-sscreen';
  GeoLocatorScreen({Key? key}) : super(key: key);
  @override
  _GeoLocatorScreenState createState() => _GeoLocatorScreenState();
}

class _GeoLocatorScreenState extends State<GeoLocatorScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkLocationAccess();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/location.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: _isLoading
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.pink,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Gaining Location Permission',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                              backgroundColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });
    final provider = Provider.of<TransactionProvider>(context, listen: false);

    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    provider.latitude = currentPosition.latitude.toString();
    provider.longitude = currentPosition.longitude.toString();
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushNamed(UserloginScreen.routeName);
  }

  Future<void> checkLocationAccess() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission asked = await Geolocator.requestPermission();
      if (asked == LocationPermission.denied ||
          asked == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            backgroundColor: Colors.pink,
            contentTextStyle: TextStyle(color: Colors.white),
            content: Text('We need location permission'),
            actions: [
              TextButton(
                onPressed: () async {
                  final didOpen = await Geolocator.openAppSettings();
                  setState(() {});
                },
                child:
                    Text('Grant Access', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );

        setState(() {});
      } else {
        getCurrentLocation();
      }
    } else {
      getCurrentLocation();
    }
  }
}
