import 'dart:io';
import 'package:etax/widgets/topbar.dart';

import 'payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/transaction_provider.dart';

class VehicleInformationScreen extends StatefulWidget {
  static const routeName = '/vehicle-information-screen';
  const VehicleInformationScreen({Key? key}) : super(key: key);

  @override
  _VehicleInformationScreenState createState() =>
      _VehicleInformationScreenState();
}

class _VehicleInformationScreenState extends State<VehicleInformationScreen> {
  TextEditingController _vehicleTypeController = TextEditingController();
  TextEditingController _modelNameController = TextEditingController();
  TextEditingController _vehicleNumberController = TextEditingController();
  final _form = GlobalKey<FormState>();

  File? _image;

  @override
  void dispose() {
    _vehicleTypeController.dispose();
    _modelNameController.dispose();
    _vehicleNumberController.dispose();

    super.dispose();
  }

  Future<void> getImagefromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _saveForm(context) {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;
    if (_image == null) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Select citizenship / passport photo'),
        ),
      );
      return;
    }
    _form.currentState!.save();
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    provider.vehicleType = _vehicleTypeController.text;
    provider.modelName = _modelNameController.text;
    provider.vehicleNumber = _vehicleNumberController.text;
    provider.citizenship = _image!.path;

    Navigator.of(context).pushNamed(PaymentScreen.routeName);
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
                              'Vehicle Information',
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
                          controller: _vehicleTypeController,
                          decoration: InputDecoration(
                            label: Text(
                              'Vehicle Type',
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
                          controller: _modelNameController,
                          decoration: InputDecoration(
                            label: Text(
                              'Model Name',
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
                          controller: _vehicleNumberController,
                          decoration: InputDecoration(
                            label: Text(
                              'Vehicle Number',
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 136, 134, 134),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: _image == null
                              ? BoxDecoration(
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                  ),
                                )
                              : BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          child: _image == null
                              ? Center(child: Text('Image preview'))
                              : null,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 5, 0, 0),
                              child: ElevatedButton(
                                  child: const Icon(
                                    Icons.cloud_upload,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: getImagefromGallery),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'Citizenship / Passport Photo',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
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
