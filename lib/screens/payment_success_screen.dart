import 'package:flutter/material.dart';

import './print_slip_screen.dart';
import './personal_information_screen.dart';

class PaymentSuccessScreen extends StatefulWidget {
  static const routeName = '/payment-success-screen';
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  _PaymentSuccessScreenState createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/app_logo.png',
                  height: 230,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 30,
                ),
                const Text(
                  'Payment Successful !!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            PrintSlipScreen.routeName,
                            (Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: 200,
                        color: Theme.of(context).colorScheme.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Print Slip",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            PersonalInformationScreen.routeName,
                            (Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: 200,
                        color: Theme.of(context).colorScheme.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "New Payment",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
