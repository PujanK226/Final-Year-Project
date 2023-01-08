import 'package:etax/widgets/topbar.dart';

import 'temporary_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';
import 'vehicle_information_screen.dart';

class PermanentAddressScreen extends StatefulWidget {
  static const routeName = '/permanent-address-screen';
  const PermanentAddressScreen({Key? key}) : super(key: key);

  @override
  _PermanentAddressScreenState createState() => _PermanentAddressScreenState();
}

class _PermanentAddressScreenState extends State<PermanentAddressScreen> {
  TextEditingController _stateController = TextEditingController();
  TextEditingController _zoneController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _vdmunController = TextEditingController();
  TextEditingController _wardController = TextEditingController();
  bool checkboxListTileValue = false;
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _stateController.dispose();
    _zoneController.dispose();
    _districtController.dispose();
    _vdmunController.dispose();
    _wardController.dispose();

    super.dispose();
  }

  void _saveForm(context) {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;
    _form.currentState!.save();
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    provider.pState = _stateController.text;
    provider.pZone = _zoneController.text;
    provider.pDistrict = _districtController.text;
    provider.pVdc = _vdmunController.text;
    provider.pWard = _wardController.text;

    if (checkboxListTileValue) {
      provider.tState = _stateController.text;
      provider.tZone = _zoneController.text;
      provider.tDistrict = _districtController.text;
      provider.tVdc = _vdmunController.text;
      provider.tWard = _wardController.text;
      Navigator.pushNamed(context, VehicleInformationScreen.routeName);
    } else {
      Navigator.of(context).pushNamed(
        TemporaryAddressScreen.routeName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'Permanent Address',
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
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _stateController,
                          decoration: InputDecoration(
                            label: Text(
                              'State',
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
                            if (value.length < 3) {
                              return 'At least three character long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        TextFormField(
                          controller: _zoneController,
                          decoration: InputDecoration(
                            label: Text(
                              'Zone',
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
                              return 'required field';
                            }
                            if (value.length < 3) {
                              return 'At least three character long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        TextFormField(
                          controller: _districtController,
                          decoration: InputDecoration(
                            label: Text(
                              'District',
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
                            if (value.length < 3) {
                              return 'At least three character long';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        TextFormField(
                          controller: _vdmunController,
                          decoration: InputDecoration(
                            label: Text(
                              'VDC/ Municipality',
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
                            if (value.length < 3) {
                              return 'At least three character long';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _wardController,
                          decoration: InputDecoration(
                            label: Text(
                              'Ward No.',
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
                              return 'Number is required ';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                  child: Text(
                    'Temporary Address',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Color(0xFF95A1AC),
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue = newValue!),
                      title: const Text(
                        'Same As Permanent Address',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      tileColor: Color(0xFF3685CE),
                      activeColor: Colors.white,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        _saveForm(context);
                      },
                      child: Container(
                        width: 200,
                        color: Theme.of(context).colorScheme.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Next",
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
