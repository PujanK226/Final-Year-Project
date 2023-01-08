import 'package:etax/widgets/topbar.dart';

import 'payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../widgets/firebase_api.dart';
import '../models/transaction_model.dart';
import '../providers/transaction_provider.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment-screen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _saveForm(context) async {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;
    _form.currentState!.save();
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    provider.paymentAmount = '200';
    provider.paymentMode = "Khalti";
    provider.creation = DateTime.now().toString().substring(0, 10);

    TransactionModel mtransaction = TransactionModel(
      id: '',
      longitude: provider.longitude,
      latitude: provider.latitude,
      firstName: provider.firstName,
      lastName: provider.lastName,
      email: provider.email,
      phoneNumber: provider.phoneNumber,
      pState: provider.pState,
      pZone: provider.pZone,
      pDistrict: provider.pDistrict,
      pVdc: provider.pVdc,
      pWard: provider.pWard,
      tState: provider.tState,
      tZone: provider.tZone,
      tDistrict: provider.tDistrict,
      tVdc: provider.tVdc,
      tWard: provider.tWard,
      vehicleType: provider.vehicleType,
      modelName: provider.modelName,
      vehicleNumber: provider.vehicleNumber,
      citizenship: provider.citizenship,
      passport: provider.passport,
      paymentAmount: provider.paymentAmount,
      paymentMode: provider.paymentMode,
      creation: provider.creation,
    );

    try {
      setState(() {
        _isLoading = true;
      });
      await FirebaseApi.createTransaction(mtransaction);

      Navigator.of(context).pushNamed(PaymentSuccessScreen.routeName);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      const message = 'An error occurred';
      const snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final config = PaymentConfig(
    amount: 20000, // Amount should be in paisa
    productIdentity: 'Vehicle Tax',
    productName: 'Vehicle Tax ',
    productUrl: 'https://www.khalti.com/#/bazaar',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TopBar(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'assets/About.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _form,
                  child: TextFormField(
                    initialValue: '200',
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        'Amount',
                        style: TextStyle(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required field ';
                      }
                      if (int.parse(value) < 50) {
                        return 'minimum amount is Rs.50';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              RadioListTile<int>(
                value: 0,
                groupValue: 0,
                activeColor: Colors.white,
                onChanged: (value) {},
                title: const Text('Khalti'),
              ),
              if (_isLoading) CircularProgressIndicator(),
              KhaltiButton.wallet(
                config: config,
                onSuccess: (successModel) {
                  _saveForm(context);
                },
                onFailure: (failureModel) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        failureModel.message,
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
