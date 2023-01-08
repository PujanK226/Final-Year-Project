import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';
import './personal_information_screen.dart';

class PrintSlipScreen extends StatefulWidget {
  static const routeName = '/print-slip-screen';
  const PrintSlipScreen({Key? key}) : super(key: key);

  @override
  _PrintSlipScreenState createState() => _PrintSlipScreenState();
}

class _PrintSlipScreenState extends State<PrintSlipScreen> {
  Widget _buildHeader(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildData(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Your Slip'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              PersonalInformationScreen.routeName,
              (Route<dynamic> route) => false);
        },
        child: Icon(Icons.done),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Image(
                    image: FileImage(
                      File(provider.citizenship),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      _buildHeader('Info'),
                      _buildHeader('Value'),
                    ]),
                    TableRow(children: [
                      _buildData('Date'),
                      _buildData(provider.creation),
                    ]),
                    TableRow(children: [
                      _buildData('Longitude'),
                      _buildData(provider.longitude),
                    ]),
                    TableRow(children: [
                      _buildData('Latitude'),
                      _buildData(provider.latitude),
                    ]),
                    TableRow(children: [
                      _buildData('First Name'),
                      _buildData(provider.firstName),
                    ]),
                    TableRow(children: [
                      _buildData('Last Name'),
                      _buildData(provider.lastName),
                    ]),
                    TableRow(children: [
                      _buildData('E-mail'),
                      _buildData(provider.email),
                    ]),
                    TableRow(children: [
                      _buildData('Phone Number'),
                      _buildData(provider.phoneNumber),
                    ]),
                    TableRow(children: [
                      _buildData('Permanent State'),
                      _buildData(provider.pState),
                    ]),
                    TableRow(children: [
                      _buildData('Permanent Zone'),
                      _buildData(provider.pZone),
                    ]),
                    TableRow(children: [
                      _buildData('Permanent District'),
                      _buildData(provider.pDistrict),
                    ]),
                    TableRow(children: [
                      _buildData('Permanent VDC/MUN'),
                      _buildData(provider.pVdc),
                    ]),
                    TableRow(children: [
                      _buildData('Permanent Ward'),
                      _buildData(provider.pWard),
                    ]),
                    TableRow(children: [
                      _buildData('Temporary State'),
                      _buildData(provider.tState),
                    ]),
                    TableRow(children: [
                      _buildData('Temporary Zone'),
                      _buildData(provider.tZone),
                    ]),
                    TableRow(children: [
                      _buildData('Temporary District'),
                      _buildData(provider.tDistrict),
                    ]),
                    TableRow(children: [
                      _buildData('Temporary VDS/MUN'),
                      _buildData(provider.tVdc),
                    ]),
                    TableRow(children: [
                      _buildData('Temporary Ward'),
                      _buildData(provider.tWard),
                    ]),
                    TableRow(children: [
                      _buildData('Vechicle Type'),
                      _buildData(provider.vehicleType),
                    ]),
                    TableRow(children: [
                      _buildData('Model Name'),
                      _buildData(provider.modelName),
                    ]),
                    TableRow(children: [
                      _buildData('Vehicle Number'),
                      _buildData(provider.vehicleNumber),
                    ]),
                    TableRow(children: [
                      _buildData('Payment Mode'),
                      _buildData(provider.paymentMode),
                    ]),
                    TableRow(children: [
                      _buildData('Paid Amount'),
                      _buildData(provider.paymentAmount),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
