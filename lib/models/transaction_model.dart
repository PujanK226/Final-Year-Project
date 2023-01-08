import 'dart:io';

import 'package:flutter/material.dart';

class TransactionModel {
  String id;
  final String longitude;
  final String latitude;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String pState;
  final String pZone;
  final String pDistrict;
  final String pVdc;
  final String pWard;
  final String tState;
  final String tZone;
  final String tDistrict;
  final String tVdc;
  final String tWard;
  final String vehicleType;
  final String modelName;
  final String vehicleNumber;
  final String citizenship;
  final String passport;
  final String paymentAmount;
  final String paymentMode;
  final String creation;

  TransactionModel({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.pState,
    required this.pZone,
    required this.pDistrict,
    required this.pVdc,
    required this.pWard,
    required this.tState,
    required this.tZone,
    required this.tDistrict,
    required this.tVdc,
    required this.tWard,
    required this.vehicleType,
    required this.modelName,
    required this.vehicleNumber,
    required this.citizenship,
    required this.passport,
    required this.paymentAmount,
    required this.paymentMode,
    required this.creation,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'pState': pState,
        'pZone': pZone,
        'pDistrict': pDistrict,
        'pVdc': pVdc,
        'pWard': pWard,
        'tState': tState,
        'tZone': tZone,
        'tDistrict': tDistrict,
        'tVdc': tVdc,
        'tWard': tWard,
        'vehicleType': vehicleType,
        'modelName': modelName,
        'vehicleNumber': vehicleNumber,
        'citizenship': citizenship,
        'passport': passport,
        'paymentAmount': paymentAmount,
        'paymentMode': paymentMode,
        'creation': creation,
      };
}
