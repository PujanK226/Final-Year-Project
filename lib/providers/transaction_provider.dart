import 'dart:math';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  String _id = Random(5).toString();
  String _longitude = ' ';
  String _latitude = ' ';
  String _firstName = ' ';
  String _lastName = ' ';
  String _email = ' ';
  String _phoneNumber = ' ';
  String _pState = ' ';
  String _pZone = ' ';
  String _pDistrict = ' ';
  String _pVdc = ' ';
  String _pWard = ' ';
  String _tState = ' ';
  String _tZone = ' ';
  String _tDistrict = ' ';
  String _tVdc = ' ';
  String _tWard = ' ';
  String _vehicleType = ' ';
  String _modelName = ' ';
  String _vehicleNumber = ' ';
  String _citizenship = '';
  String _passport = ' ';
  String _paymentAmount = ' ';
  String _paymentMode = ' ';
  String _creation = ' ';
  set id(var value) {
    _id = value;
    notifyListeners();
  }

  set longitude(var value) {
    _longitude = value;
    notifyListeners();
  }

  set latitude(var value) {
    _latitude = value;
    notifyListeners();
  }

  set firstName(var value) {
    _firstName = value;
    notifyListeners();
  }

  set lastName(var value) {
    _lastName = value;
    notifyListeners();
  }

  set email(var value) {
    _email = value;
    notifyListeners();
  }

  set phoneNumber(var value) {
    _phoneNumber = value;
    notifyListeners();
  }

  set pState(var value) {
    _pState = value;
    notifyListeners();
  }

  set pZone(var value) {
    _pZone = value;
    notifyListeners();
  }

  set pDistrict(var value) {
    _pDistrict = value;
    notifyListeners();
  }

  set pVdc(var value) {
    _pVdc = value;
    notifyListeners();
  }

  set pWard(var value) {
    _pWard = value;
    notifyListeners();
  }

  set tState(var value) {
    _tState = value;
    notifyListeners();
  }

  set tZone(var value) {
    _tZone = value;
    notifyListeners();
  }

  set tDistrict(var value) {
    _tDistrict = value;
    notifyListeners();
  }

  set tVdc(var value) {
    _tVdc = value;
    notifyListeners();
  }

  set tWard(var value) {
    _tWard = value;
    notifyListeners();
  }

  set vehicleType(var value) {
    _vehicleType = value;
    notifyListeners();
  }

  set modelName(var value) {
    _modelName = value;
    notifyListeners();
  }

  set vehicleNumber(var value) {
    _vehicleNumber = value;
    notifyListeners();
  }

  set citizenship(var value) {
    _citizenship = value;
    notifyListeners();
  }

  set passport(var value) {
    _passport = value;
    notifyListeners();
  }

  set paymentAmount(var value) {
    _paymentAmount = value;
    notifyListeners();
  }

  set paymentMode(var value) {
    _paymentMode = value;
    notifyListeners();
  }

  set creation(var value) {
    _creation = value;
    notifyListeners();
  }

  String get id => _id;
  String get longitude => _longitude;
  String get latitude => _latitude;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get pState => _pState;
  String get pZone => _pZone;
  String get pDistrict => _pDistrict;
  String get pVdc => _pVdc;
  String get pWard => _pWard;
  String get tState => _tState;
  String get tZone => _tZone;
  String get tDistrict => _tDistrict;
  String get tVdc => _tVdc;
  String get tWard => _tWard;
  String get vehicleType => _vehicleType;
  String get modelName => _modelName;
  String get vehicleNumber => _vehicleNumber;
  String get citizenship => _citizenship;
  String get passport => _passport;
  String get paymentAmount => _paymentAmount;
  String get paymentMode => _paymentMode;
  String get creation => _creation;
}
