import 'package:flutter/material.dart';

String baseUrl = 'https://larappex.com';
late BuildContext appContext;

enum TypeEnum {
  string,
  longString,
  digit,
  password,
  loginCode,
  email,
  mobile,
  postalCode,
  phone,
  date,
  iban,
  nationalCode,
  card,
  cvv2,
  nationalCodeSerial,
  money
}

const appBaseUrl = String.fromEnvironment('BASE_URL');
const appBaseUrlInstantName = 'BASE_URL';
