import 'dart:io';
import 'package:etax/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:image_compare/image_compare.dart';

import '../widgets/local_auth_api.dart';
import './personal_information_screen.dart';

class UserloginScreen extends StatefulWidget {
  static const routeName = '/user-login-screen';
  UserloginScreen(
      {Key? key, required this.themeChanger, required this.isDarkMode})
      : super(key: key);
  final dynamic themeChanger;
  final bool isDarkMode;
  @override
  _UserloginScreenState createState() => _UserloginScreenState();
}

class _UserloginScreenState extends State<UserloginScreen> {
  File? userDataFile;
  File? loginDataFile;
  bool isAunthicated = false;
  bool _isLoading = false;

  Future<void> _takePictureForLogin() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      preferredCameraDevice: CameraDevice.front,
    );
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    const fileName = 'userLogin.jpg';
    final savedImage =
        await File(imageFile!.path).copy('${appDir.path}/$fileName');
    setState(() {
      loginDataFile = savedImage;
    });
    File file1 = userDataFile!;
    File file2 = savedImage;
    var result = await compareImages(
      src1: file1,
      src2: file2,
      algorithm: PerceptualHash(),
    );
    if (result < 0.8) {
      setState(() {
        isAunthicated = true;
      });
      setState(() {
        _isLoading = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Login Success!',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushNamed(PersonalInformationScreen.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Login Failed! Try Again.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _takePicture(bool dataOverride) async {
    final prefs = await SharedPreferences.getInstance();

    if (dataOverride) {
      prefs.clear();
    }
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      preferredCameraDevice: CameraDevice.front,
    );

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    const fileName = 'userData.jpg';
    final savedImage =
        await File(imageFile!.path).copy('${appDir.path}/$fileName');

    prefs.setString('userData', savedImage.path);
    setState(() {
      userDataFile = savedImage;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'User Registration Successful!',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      setState(() {
        userDataFile = File(userData);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ThemeSwitcher(
                  toggleTheme: widget.themeChanger,
                  isDarkMode: widget.isDarkMode,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Image.asset(
                'assets/app_logo.png',
                width: MediaQuery.of(context).size.width - 100,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Welcome To Etax',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            if (Platform.isAndroid)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: Image.asset(
                            'assets/Concerned_Face.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (userDataFile == null) {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('No registered User found'),
                                ),
                              );
                              return;
                            }
                            _takePictureForLogin();
                          },
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 200,
                                height: 50,
                                color: Theme.of(context).colorScheme.primary,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Authenticate",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
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
                ],
              ),
            if (Platform.isIOS)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                      child: Image.asset(
                        'assets/Concerned_Face.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final isAuthenticated =
                            await LocalAuthApi.authenticate();
                        if (isAuthenticated) {
                          Navigator.of(context)
                              .pushNamed(PersonalInformationScreen.routeName);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 200,
                            height: 50,
                            color: Theme.of(context).colorScheme.primary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Authenticate",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
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
            SizedBox(
              height: 20,
            ),
            Text(
              'Please authenticate for access.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            if (Platform.isAndroid)
              SizedBox(
                height: 10,
              ),
            if (Platform.isAndroid)
              TextButton(
                onPressed: () {
                  if (userDataFile != null) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        content: const Text(
                          'User already Registered. Do you want to override?',
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                _takePicture(true);
                                ScaffoldMessenger.of(context)
                                    .removeCurrentMaterialBanner();
                              },
                              child: Text('Yes')),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentMaterialBanner();
                            },
                            child: Text('No'),
                          )
                        ],
                      ),
                    );
                    return;
                  }
                  _takePicture(false);
                },
                child: Text(
                  'Register Face Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            if (Platform.isAndroid && isAunthicated && _isLoading)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Loading User Info form...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
